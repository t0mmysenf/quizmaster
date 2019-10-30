<template>
    <v-form v-model="validRegistration" ref="signUpForm">
        <v-container>
            <v-row>
                <v-col>
                    <p class="headline">Sign Up</p>
                </v-col>
            </v-row>
            <v-row>
                <v-col>
                    <v-text-field v-model="name"
                                  label="Full name"
                                  :rules="[v => !!v || 'Name is required!']"
                                  autofocus
                                  required>
                    </v-text-field>
                </v-col>
            </v-row>
            <v-row>
                <v-col>
                    <v-text-field v-model="email"
                                  type="email"
                                  label="E-mail address"
                                  :rules="[v => !!v || 'E-mail address is required!', v => takenEmails.indexOf(v) < 0 || 'This e-mail address is already taken by another user!']"
                                  required>
                    </v-text-field>
                </v-col>
            </v-row>
            <v-row>
                <v-col>
                    <v-text-field v-model="password"
                                  label="Password"
                                  :rules="[v => !!v || 'Password is required!', v => v.length >= 8 || 'Please use at least 8 characters for your secure password!']"
                                  :append-icon="showPassword ? 'visibility' : 'visibility_off'"
                                  :type="showPassword ? 'text' : 'password'"
                                  @click:append="showPassword = !showPassword"
                                  required
                    ></v-text-field>
                </v-col>
            </v-row>
            <v-row>
                <v-col>
                    <v-text-field v-model="password_confirmation"
                                  label="Password confirmation"
                                  :rules="[v => v === password || 'Password confirmation does not match password!']"
                                  :append-icon="showPassword ? 'visibility' : 'visibility_off'"
                                  :type="showPassword ? 'text' : 'password'"
                                  @click:append="showPassword = !showPassword"
                                  required
                    ></v-text-field>
                </v-col>
            </v-row>
            <v-row>
                <v-col class="text-center">
                    <v-btn :disabled="!validRegistration"
                           @click.prevent="signUp">
                        Sign up
                    </v-btn>
                </v-col>
            </v-row>
        </v-container>
    </v-form>
</template>

<script>
    import Vue from 'vue';
    import Axios from "axios";

    export default {
        name: "SignUp",
        data: () => ({
            name: '',
            email: '',
            password: '',
            password_confirmation: '',
            showPassword: false,
            validRegistration: false,
            takenEmails: [],
        }),
        methods: {
            signUp() {
                Axios.post('/signUp', {
                    name: this.name,
                    email: this.email,
                    password: this.password,
                    password_confirmation: this.password_confirmation,
                })
                    .then(response => {
                        if (response.status === 200) {
                            const token = response.data.success.token;
                            Axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
                            window.localStorage.setItem('token', response.data.success.token);
                            Vue.set(this.$root.$data.user, 'token', response.data.success.token);
                            return this.loadUserProfile();
                        }
                    })
                    .then(() => {
                        this.$router.push('/quizzes');
                    })
                    .catch(error => {
                        console.log(error);
                        if (error.response.status === 401) {
                            const errors = error.response.data.error;
                            for (const [field, fieldErrors] of Object.entries(errors)) {
                                console.log(field, fieldErrors);
                                this.takenEmails.push(this.email);
                                this.$refs.signUpForm.validate();
                            }
                        }
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