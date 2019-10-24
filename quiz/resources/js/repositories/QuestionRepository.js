import Repository from './Repository';

const resource = '/questions';

export default {
    get() {
        return Repository.get(`${resource}`);
    },

    getForQuiz(quizId) {
        return Repository.get(`quizzes/${quizId}${resource}`);
    },

    getQuestion(questionId) {
        return Repository.get(`${resource}/${questionId}`);
    },

    createQuestion(payload) {
        return Repository.post(`${resource}`, payload);
    }
}