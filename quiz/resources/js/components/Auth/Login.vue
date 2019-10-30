<template>
    <v-container>
        <v-row>
            <v-col>
                <p class="display-1">Login</p>
                <p class="font-italic font-weight-light">Give me your hot credentials and I'll let you in...</p>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-text-field v-model="email"
                              label="E-mail address"
                              autofocus
                              color="green"
                              required>
                </v-text-field>
            </v-col>
            <v-col>
                <v-text-field v-model="password"
                              label="Password"
                              :append-icon="showPassword ? 'visibility' : 'visibility_off'"
                              :type="showPassword ? 'text' : 'password'"
                              @click:append="showPassword = !showPassword"
                              color="green"
                              required>
                </v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col class="text-center">
                <v-btn @click.prevent="login">Login</v-btn>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <p class="text-center">
                    No account yet?
                    <br/>
                    <a href="/signUp">Go create one!</a>
                </p>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import Vue from 'vue';
    import Axios from 'axios';

    export default {
        name: "Login",
        data: () => ({
            email: '',
            password: '',
            showPassword: false,
        }),
        methods: {
            login() {
                Axios.post('/login', {
                    email: this.email,
                    password: this.password
                })
                    .then((response) => {
                        if (response.status === 200) {
                            const token = response.data.success.token;
                            Axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
                            window.localStorage.setItem('token', response.data.success.token);
                            Vue.set(this.$root.$data.user, 'token', response.data.success.token);
                            return this.loadUserProfile();
                        } else {
                            throw Error('Login failed');
                        }
                    })
                    .then(() => {
                        this.$router.push('/quizzes');
                    })
                    .catch(error => {
                        // TODO: notify user about failed login
                        console.error(error);
                        window.localStorage.removeItem('token');
                        this.$root.$data.user = {};
                    });
            },

            loadUserProfile() {
                Axios.get('/profile')
                    .then(response => {
                        const userData = response.data.success;
                        Vue.set(this.$root.$data.user, 'id', userData.id);
                        Vue.set(this.$root.$data.user, 'name', userData.name);
                        Vue.set(this.$root.$data.user, 'email', userData.email);
                    })
            }
        }
    }
</script>

<style scoped>

</style>