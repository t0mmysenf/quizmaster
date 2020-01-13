<template>
    <v-container>
        <v-row>
            <v-col>
                <p class="display-1">Create new Yes/No Question</p>
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
                <v-btn block
                       @click="cancel">
                    <v-icon left>mdi-cancel</v-icon>
                    Cancel
                </v-btn>
            </v-col>
            <v-col>
                <v-btn block
                       @click="saveYesNoQuestion"
                       :disabled="requestPending">
                    <v-icon left>save</v-icon>
                    Save Question
                </v-btn>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import QuestionForm from "./QuestionForm";
    import AnswerForm from "../Answer/AnswerFormYesNo";
    import {RepositoryFactory} from "../../repositories/RepositoryFactory";
    import AnswerRepository from "../../repositories/AnswerRepository";

    const QuestionRepository = RepositoryFactory.get('questions');
    export default {
        name: "NewYesNoQuestion",
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

            async saveYesNoQuestion() {
                this.requestPending = true;
                this.formData.quiz_id = this.quizId; // Add quiz id to question!
                this.formData.isYesNo = true;
                QuestionRepository.createQuestion(this.formData)
                    .then(response => {
                        if (response.status === 200) {
                            return response.data.id;
                        }
                    })
                    .then(questionId => {
                        Promise.all(this.answers.map(answer => {
                            answer.question_id = questionId;
                            answer.answerText = 'Is this True?'
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