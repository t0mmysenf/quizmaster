<template>
    <v-container>
        <v-row>
            <v-col>
                <p class="display-1">Create new Question</p>
                <p class="font-italic font-weight-light">Okay, now let's get started! Write down your question and as
                    many answers as you like. But remember - at least one answer should be marked as correct.</p>
                <p class="font-italic font-weight-light">Oh, and by the way: Your questions title will be visible in the
                    quiz's overview! So refrain from giving away too much information there!</p>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <question-form v-model="formData"
                               @validation="onQuestionValidation"
                               :disable-fields="requestPending"/>
            </v-col>
        </v-row>
        <v-row v-for="(answer, index) in answers"
               :key="index"
               align="center">
            <v-col cols="10">
                <answer-form v-model="answers[index]"
                             @validation="(validity) => {onAnswerValidation(index, validity);}"/>
            </v-col>
            <v-col cols="2"
                   class="text-center">
                <v-btn icon @click="() => {deleteAnswer(index);}">
                    <v-icon>mdi-delete</v-icon>
                </v-btn>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-btn text
                       color="green"
                       @click="addAnswer">
                    <v-icon left color="green">
                        add
                    </v-icon>
                    Add Answer
                </v-btn>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-btn block
                       @click="cancel">
                    <v-icon left>mdi-cancel</v-icon>
                    Cancel
                </v-btn>
            </v-col>
            <v-col>
                <v-btn block
                       @click="saveQuestion"
                       :disabled="requestPending || !validQuestion || validAnswers.indexOf(false) >= 0 || answers.filter(answer => answer.isCorrect).length === 0">
                    <v-icon left>save</v-icon>
                    Save Question
                </v-btn>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import QuestionForm from "./QuestionForm";
    import AnswerForm from "../Answer/AnswerForm";
    import {RepositoryFactory} from "../../repositories/RepositoryFactory";
    import AnswerRepository from "../../repositories/AnswerRepository";

    const QuestionRepository = RepositoryFactory.get('questions');

    export default {
        name: "NewQuestion",
        components: {QuestionForm, AnswerForm},
        props: {
            quizId: Number
        },
        data: () => ({
            formData: {},
            requestPending: false,
            validQuestion: false,
            answers: [{answerText: '', isCorrect: false}],
            validAnswers: [],
        }),
        methods: {
            cancel() {
                this.$router.go(-1);
            },

            async saveQuestion() {
                this.requestPending = true;
                this.formData.quiz_id = this.quizId;    // Add quiz id to question!
                QuestionRepository.createQuestion(this.formData)
                    .then(response => {
                        if (response.status === 200) {
                            return response.data.id;
                        }
                    })
                    .then(questionId => {
                        Promise.all(this.answers.map(answer => {
                            answer.question_id = questionId;
                            return AnswerRepository.createAnswer(answer);
                        }));
                    })
                    .then(() => {
                        this.$router.push(`/quizzes/${this.quizId}`)
                    })
                    .catch(() => {
                        this.showSnackbar("Could not persist question!");
                    })
                    .finally(() => {
                        this.requestPending = false;
                    });
            },

            addAnswer() {
                this.answers.push({isCorrect: false});
                this.validAnswers.push(false);
            },

            deleteAnswer(answerIndex) {
                this.answers.splice(answerIndex, 1);
                this.validAnswers.splice(answerIndex, 1);
            },

            onQuestionValidation(validity) {
                this.validQuestion = validity;
            },

            onAnswerValidation(answerIndex, validity) {
                this.validAnswers[answerIndex] = validity;
            }
        }
    }
</script>

<style scoped>

</style>