import Vue from 'vue';
import VueRouter from 'vue-router';
import Vuetify from 'vuetify';
import App from './components/App';
import routes from './routes';
import Axios from 'axios';
import colors from 'vuetify/lib/util/colors';
import '@mdi/font/css/materialdesignicons.css';

Vue.use(VueRouter);

Vue.use(Vuetify);

export default new Vuetify({
    theme: {
        dark: false,
        themes: {
            dark: {
                primary: colors.purple,
                secondary: colors.grey.darken1,
                accent: colors.shades.black,
                error: colors.red.accent3,
            },
        },
    },
});

const router = new VueRouter({
    mode: 'history',
    routes: routes
});

Axios.defaults.headers.common['Content-Type'] = 'application/json';
Axios.defaults.baseURL = '/api';

router.beforeEach((to, from, next) => {
    if (to.fullPath === '/'
        || to.fullPath === '/login'
        || to.fullPath.toLowerCase() === '/signup') {
        next();
    } else {
        let token = window.localStorage.getItem('token');
        Axios.get('/profile', {
            headers: {'Authorization': `Bearer ${token}`}
        })
            .then(() => {
                next();
            })
            .catch(() => {
                router.push('/login');
            });
    }
});

const app = new Vue({
    el: '#app',
    components: {App},
    router: router,
    vuetify: new Vuetify({
        icons: 'mdi',
        theme: {
            dark: false,
            themes: {
                dark: {
                    primary: colors.green,
                    secondary: colors.grey.darken1,
                    accent: colors.shades.black,
                    error: colors.red.accent3,
                },
            },
        },
    }),
    data: () => ({
        user: {
            token: window.localStorage.getItem('token') || null,
        },
    }),
    mounted() {
        if (this.user.hasOwnProperty('token') && this.user.token !== null) {
            Axios.get('/api/profile', {
                headers: {
                    'Accept': 'application/json',
                    'Authorization': `Bearer ${this.user.token}`,
                }
            })
                .then(response => {
                    if (response.status === 200) {
                        const userData = response.data.success;
                        this.user.id = userData.id;
                        this.user.name = userData.name;
                        this.user.email = userData.email;
                    }
                })
        }
    }
});