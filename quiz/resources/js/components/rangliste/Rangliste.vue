<template>
    <v-container fluid>
        <v-row>
            <v-col>
                <p class="display-1">Best players</p>
            </v-col>
        </v-row>

        <v-row>
            <v-col>
                <v-card tile>
                    <v-list three-line>
                        <template v-for="user in users">
                            <v-list-item :key="user.id">
                                <v-list-item-content>
                                    <v-list-item-title v-text="user.email"></v-list-item-title>
                                    <v-list-item-subtitle v-text="user.points"></v-list-item-subtitle>
                                </v-list-item-content>
                            </v-list-item>
                        </template>
                    </v-list>
                </v-card>
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

    const UserRepository = RepositoryFactory.get('users');

    export default {
        name: "UserList",
        data: () => ({
            users: [],
            snackbarText: '',
            snackbar: false,
        }),

        created() {
            this.fetchData();
        },

        methods: {
            fetchData() {
                UserRepository.get()
                    .then(response => {
                        if (response.status === 200) {
                            this.users = response.data;
                        } else {
                            throw Error("Failed loading users.");
                        }
                    })
                    .catch(() => {
                        this.showSnackbar("Failed loading users.");
                    });

            },

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