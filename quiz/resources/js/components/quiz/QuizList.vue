<template>
    <v-container fluid>
        <v-row>
            <v-col>
                <p class="display-1">Quizzes</p>
                <p class="font-italic font-weight-light">
                    Here's a list of amazing quizzes. Proof your profound knowledge across various topics!
                </p>
            </v-col>
        </v-row>

        <v-row>
            <v-col>
                <v-card tile>
                    <v-list three-line>
                        <template v-for="quiz in quizzes">
                            <v-list-item :key="quiz.id"
                                         :to="'/quizzes/' + quiz.id">
                                <v-list-item-content>
                                    <v-list-item-title v-text="quiz.title"></v-list-item-title>
                                    <v-list-item-subtitle v-text="quiz.description"></v-list-item-subtitle>
                                </v-list-item-content>
                                <v-list-item-action>
                                    <v-btn v-if="quiz.user_id === $root.$data.user.id"
                                           icon
                                           :to="`/quizzes/${quiz.id}`">
                                        <v-icon color="green">edit</v-icon>
                                    </v-btn>
                                    <v-btn icon
                                           :to="`/quizzes/${quiz.id}/play`">
                                        <v-icon color="green">mdi-play-circle</v-icon>
                                    </v-btn>
                                </v-list-item-action>
                            </v-list-item>
                        </template>
                    </v-list>
                </v-card>
            </v-col>
        </v-row>

        <v-row justify="center">
            <v-col class="text-center">
                <v-btn to="new-quiz">
                    <v-icon left color="green">add</v-icon>
                    Create new QU!Z
                </v-btn>
            </v-col>
        </v-row>

        <v-snackbar v-model="snackbar"
                    :right="true"
                    :top="true">
            {{ snackbarText }}
        </v-snackbar>

    </v-container>
</template>

<script>
    import {RepositoryFactory} from "./../../repositories/RepositoryFactory";

    const QuizRepository = RepositoryFactory.get('quizzes');

    export default {
        name: "QuizList",
        data: () => ({
            quizzes: [],
            snackbarText: '',
            snackbar: false,
        }),
        mounted() {
            QuizRepository.get()
                .then(response => {
                    if (response.status === 200) {
                        this.quizzes = response.data;
                    } else {
                        throw Error("Failed loading quizzes.");
                    }
                })
                .catch(() => {
                    this.showSnackbar("Failed loading quizzes.");
                });
        },
        methods: {
            showSnackbar(text) {
                this.snackbarText = text;
                this.snackbar = true;
            },
        }
    }
</script>

<style scoped>
    .v-list-item__action--stack {
        flex-direction: row;
    }
</style>