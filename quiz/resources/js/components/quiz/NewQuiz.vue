<template>
    <v-container fluid>
        <v-row>
            <v-col>
                <p class="display-1">Create a new QU!Z</p>
                <p class="font-italic font-weight-light">Give your QU!Z a crazy name and tell the guys out there something about it!</p>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <quiz-form v-model="formData"
                           @validation="onFormValidation"
                           :disable-fields="requestPending"/>
            </v-col>
        </v-row>
        <v-row justify="center">
            <v-btn @click="saveQuiz"
                   :disabled="requestPending || !validForm">
                <v-icon left color="green">save</v-icon>
                Save QU!Z
            </v-btn>
        </v-row>

        <v-snackbar v-model="snackbar"
                    :right="true"
                    :top="true">
            {{ snackbarText }}
        </v-snackbar>
    </v-container>
</template>

<script>
    import Vue from 'vue';
    import QuizForm from "./QuizForm";
    import {RepositoryFactory} from "./../../repositories/RepositoryFactory";

    const QuizRepository = RepositoryFactory.get('quizzes');

    export default {
        name: "NewQuiz",
        components: {QuizForm},
        data: () => ({
            formData: {},
            requestPending: false,
            validForm: false,
            snackbar: false,
            snackbarText: '',
        }),
        methods: {
            async saveQuiz() {
                this.requestPending = true;
                QuizRepository.createQuiz(this.formData)
                    .then(response => {
                        if (response.status === 201) {
                            this.$router.push(`/quizzes/${response.data.id}/`);
                        }
                    })
                    .catch(() => {
                        this.showSnackbar("Could not persist quiz!");
                    })
                    .finally(() => {
                        this.requestPending = false;
                    });
            },

            showSnackbar(text) {
                this.snackbarText = text;
                this.snackbar = true;

            },

            onFormValidation(validity) {
                this.validForm = validity;
            }
        }
    }
</script>

<style scoped>

</style>