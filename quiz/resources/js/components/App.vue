<template>
    <v-app>

        <navigation-drawer v-model="drawer"></navigation-drawer>

        <v-app-bar app
                   color="green"
                   dark
                   clipped-left>

            <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>

            <v-toolbar-title>QU!Z</v-toolbar-title>

            <v-spacer></v-spacer>

            <v-btn v-if="!activeUser"
                   icon
                   to="/login">
                <v-icon>mdi-login</v-icon>
            </v-btn>

            <v-btn v-else
                   icon
                   to="/logout">
                <v-icon>mdi-logout</v-icon>
            </v-btn>
        </v-app-bar>

        <v-content>
            <router-view></router-view>
        </v-content>

        <v-footer app
                  color="green">
            <span class="white--text">&copy; GIBZ 2019</span>
        </v-footer>
    </v-app>
</template>

<script>
    import NavigationDrawer from "./navigation/NavigationDrawer";

    export default {
        components: {NavigationDrawer},
        props: {
            source: String,
        },
        data: () => ({
            drawer: false,
            activeUser: false,
        }),
        created() {
            this.checkLoginStatus();
        },
        methods: {
            checkLoginStatus() {
                if (!this.$root.$data.hasOwnProperty('user')) {
                    console.log('a');
                    return false;
                }

                if (!this.$root.$data.user.hasOwnProperty('id')) {
                    console.log('b');
                    return false;
                }

                console.log('c');
                return this.$root.$data.user.id !== undefined;
            }
        }
    }
</script>

<style>
    a:hover {
        text-decoration: none;
    }
</style>