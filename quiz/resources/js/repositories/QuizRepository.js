import Repository from './Repository';

const resource = '/quizzes';

export default {
    get() {
        return Repository.get(`${resource}`);
    },

    getQuiz(quizId) {
        return Repository.get(`${resource}/${quizId}`);
    },

    createQuiz(payload) {
        return Repository.post(`${resource}`, payload);
    }
}