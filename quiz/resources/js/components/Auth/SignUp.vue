<template>
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
                              :rules="[v => !!v || 'E-mail address is required!']"
                              required>
                </v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-text-field v-model="password"
                              label="Password"
                              :rules="[v => !!v || 'Password is required!']"
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
            <v-col>
                <v-btn @click.prevent="signUp">Sign up</v-btn>
            </v-col>
        </v-row>
    </v-container>
</template>

<script>
    import Axios from "axios";

    export default {
        name: "SignUp",
        data: () => ({
            name: '',
            email: '',
            password: '',
            password_confirmation: '',
            showPassword: false
        }),
        methods: {
            signUp() {
                Axios.post('/api/signUp', {
                    name: this.name,
                    email: this.email,
                    password: this.password,
                    password_confirmation: this.password_confirmation,
                })
                    .then(response => {
                        if (response.status === 200) {
                            const userData = response.data.success;
                            window.localStorage.setItem('token', userData.token);
                            this.$root.$data.user.token = userData.token;
                            return Axios.get('/api/profile', {
                                headers: {
                                    'Authorization': `Bearer ${userData.token}`,
                                    'Accept': 'application/json',
                                },
                            })
                        }
                    })
                    .then(response => {
                        if (response.status === 200) {
                            const userData = response.data.success;
                            this.$root.$data.user.id = userData.id;
                            this.$root.$data.user.name = userData.name;
                            this.$root.$data.user.email = userData.email;
                            this.$router.push('/quizzes');
                        }
                    });
            }
        }
    }
</script>

<style scoped>

</style>