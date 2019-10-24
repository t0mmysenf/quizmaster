<template>
    <v-card tile>
        <v-list three-line>
            <template v-for="question in questions">
                <v-list-item :key="question.id">
                    <v-list-item-content>
                        <v-list-item-title v-text="question.title"></v-list-item-title>
                        <v-list-item-subtitle v-text="question.questionText"></v-list-item-subtitle>
                    </v-list-item-content>
                </v-list-item>
            </template>
        </v-list>
    </v-card>
</template>

<script>
    import {RepositoryFactory} from '../../repositories/RepositoryFactory';

    const QuestionRepository = RepositoryFactory.get('questions');

    export default {
        name: "QuestionList",
        props: {
            quiz: Object,
        },
        data: () => ({
            questions: [],
            loading: false,
        }),
        created() {
            this.fetchData();
        },
        methods: {
            fetchData() {
                this.loading = true;
                QuestionRepository.getForQuiz(this.quiz.id)
                    .then(response => {
                        if (response.status === 200) {
                            this.questions = response.data;
                        }
                    })
                    .finally(() => {
                        this.loading = false;
                    })
            }
        }
    }
</script>

<style scoped>

</style>