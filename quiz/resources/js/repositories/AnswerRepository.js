import Repository from './Repository';

const resource = '/answers';

export default {
    get() {
        return Repository.get(`${resource}`);
    },

    getForQuestion(questionId) {
        return Repository.get(`questions/${questionId}${resource}`);
    },

    getAnswer(answerId) {
        return Repository.get(`${resource}/${answerId}`);
    },

    createAnswer(payload) {
        return Repository.post(`${resource}`, payload);
    }
}