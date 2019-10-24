<template>
    <v-container>
        <v-row>
            <v-col>
                <p class="headline">{{ quiz.title }}</p>
                <p>{{ quiz.description }}</p>
            </v-col>
        </v-row>
        <v-row v-if="questions.length > 0">
            <v-col>
                <v-stepper v-model="step"
                           vertical>

                    <v-stepper-step step="0"
                                    color="green"
                                    :complete="step > 0"
                                    complete-icon="mdi-information-variant">
                        Intro
                    </v-stepper-step>
                    <v-stepper-content step="0">
                        <p>You are about to start the QU!Z named <span
                                class="font-weight-bold">{{ quiz.title }}</span>. During this quiz you'll need to
                            answer <span class="font-weight-bold">{{questions.length}} questions.</span></p>
                        <p>The faster you answer the question, the more points you may earn. But be careful: Wrong
                            answers won't bring you any points at all!</p>
                        <p>The time limit for every question is <span
                                class="font-weight-bold">{{ maxTimeMilliseconds / 1000}} seconds</span>.
                            After the time limit elapsed or after you choose the answer you may proceed manually to the
                            next question.</p>

                        <div class="text-right">
                            <v-btn text
                                   color="green"
                                   @click.prevent="step++"
                                   class="ma-1">
                                Start QU!Z
                            </v-btn>
                        </div>
                    </v-stepper-content>

                    <template v-for="(question, index) in questions">
                        <v-stepper-step :complete="step > (index + 1)"
                                        color="green"
                                        :step="index + 1">
                            {{ question.title }}
                        </v-stepper-step>
                        <v-stepper-content :step="index + 1">
                            <p class="font-weight-bold">{{ question.questionText }}</p>

                            <v-radio-group class="ml-2"
                                           v-model="results[question.id].answerId"
                                           :mandatory="false"
                                           @change="tickAnswer">
                                <v-radio v-for="answer in answers[question.id]"
                                         :key="answer.id"
                                         :label="answer.answerText"
                                         :value="answer.id"
                                         :disabled="results[question.id]['answerId'] !== null || points <= 0">
                                </v-radio>
                            </v-radio-group>

                            <v-progress-linear :value="points"
                                               color="green"
                                               striped
                                               rounded
                                               height="25">
                                <template v-slot="{ value }">
                                    <strong class="white--text">{{ Math.ceil(value) }} points</strong>
                                </template>
                            </v-progress-linear>

                            <div class="text-right">
                                <v-btn text
                                       class="ma-2"
                                       color="green"
                                       v-if="step <= questions.length && (results[question.id].answerId !== null || points <= 0)"
                                       @click.prevent="step++">
                                    next
                                </v-btn>
                            </div>

                        </v-stepper-content>
                    </template>

                    <v-stepper-step :step="questions.length + 1"
                                    :complete="step > questions.length + 1"
                                    color="green"
                                    complete-icon="mdi-trophy-variant">
                        Evaluation
                    </v-stepper-step>
                    <v-stepper-content :step="questions.length + 1">
                        <p v-if="pointsSum > 0" class="title">Congratulations!</p>
                        <p v-else class="title">Oh noooo!</p>
                        <p>You made <span class="font-weight-bold">{{ pointsSum }} points</span> in this QU!Z</p>
                        <v-row>
                            <v-col>
                                <v-btn block
                                       @click="replay">
                                    <v-icon left color="green">mdi-refresh</v-icon>
                                    Play QU!Z again
                                </v-btn>
                            </v-col>
                            <v-col>
                                <v-btn block
                                       @click="returnToList">
                                    <v-icon left color="green">mdi-format-list-bulleted</v-icon>
                                    Return to QU!Z list
                                </v-btn>
                            </v-col>
                        </v-row>
                    </v-stepper-content>
                </v-stepper>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import {RepositoryFactory} from "../../repositories/RepositoryFactory";
    import Vue from "vue";

    const QuizRepository = RepositoryFactory.get('quizzes');
    const QuestionRepository = RepositoryFactory.get('questions');
    const AnswerRepository = RepositoryFactory.get('answers');

    export default {
        name: "QuizPlay",
        props: {
            quizId: Number,
        },
        data: () => ({
            quiz: {},
            questions: [],
            answers: {},
            results: {},
            step: 0,
            loading: false,
            maxPoints: 100,
            points: 100,
            pointsSum: 0,
            maxTimeMilliseconds: 10000,
            interval: null,
        }),
        created() {
            this.fetchData();
        },
        watch: {
            step: function (step) {
                if (this.interval > 0) {
                    window.clearInterval(this.interval);
                }

                if (step > 0 && step <= this.questions.length) {
                    const millisecondsPerIntervalStep = 100;
                    const steps = this.maxTimeMilliseconds / millisecondsPerIntervalStep;
                    const pointDecrement = this.maxPoints / steps;

                    this.points = this.maxPoints;

                    this.interval = window.setInterval(() => {
                        this.points -= pointDecrement;
                        if (this.points <= 0) {
                            window.clearInterval(this.interval);
                            this.interval = null;
                        }
                    }, millisecondsPerIntervalStep);
                }

            }
        },
        methods: {
            fetchData() {
                this.loading = true;
                QuizRepository.getQuiz(this.quizId)
                    .then(response => {
                        if (response.status === 200) {
                            this.quiz = response.data;
                        }
                    });
                QuestionRepository.getForQuiz(this.quizId)
                    .then(response => {
                            if (response.status === 200) {
                                this.questions = response.data;
                                this.questions.forEach(question => {
                                    Vue.set(this.results, question.id, {
                                        answerId: null,
                                        points: null,
                                    });
                                });
                                return response.data;
                            }
                        }
                    )
                    .then(questions => Promise.all(questions.map(question => {
                        return AnswerRepository.getForQuestion(question.id);
                    })))
                    .then(answers => {
                        answers.forEach((answer, index) => {
                            this.answers[this.questions[index].id] = this.shuffle(answer.data);
                        });

                    })
                    .finally(() => {
                        this.loading = false;
                    });
            },

            tickAnswer(answerId) {
                if (this.interval) {
                    window.clearInterval(this.interval);
                }
                const question = this.questions[this.step - 1];
                this.results[question.id]['points'] = this.points;
                if (this.isCorrectAnswer(question.id, answerId)) {
                    this.pointsSum += this.points;
                }
            },

            isCorrectAnswer(questionId, answerId) {
                const correctAnswerFilter = function (answer) {
                    return answer.isCorrect === 1 && answer.id === answerId;
                };
                const correctAnswers = this.answers[questionId].filter(correctAnswerFilter);
                return correctAnswers.length > 0;
            },

            replay() {
                this.points = 0;
                this.pointsSum = 0;
                this.step = 0;
                Object.keys(this.results).forEach(key => {
                    this.results[key] = {
                        answerId: null,
                        points: null,
                    };
                });
            },

            returnToList() {
                this.$router.push('/quizzes');
            },

            shuffle(array) {
                for (let i = array.length - 1; i > 0; i--) {
                    const j = Math.floor(Math.random() * (i + 1));
                    [array[i], array[j]] = [array[j], array[i]];
                }
                return array;
            }
        }
    }
</script>

<style>
    .v-progress-linear__bar, .v-progress-linear__bar__determinate {
        transition: none;
    }

    label {
        margin-bottom: 0;
    }
</style>