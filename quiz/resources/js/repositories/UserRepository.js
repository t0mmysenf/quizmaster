import Repository from 'axios';

const resource = '/users';

export default {
    get() {
        return Repository.get(`${resource}`);
    },

    getUser(userId) {
        return Repository.get(`${resource}/${userId}`);
    },
}