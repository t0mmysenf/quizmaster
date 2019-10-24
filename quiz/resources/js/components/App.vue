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

            <v-btn v-if="$root.$data.user.id > 0"
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
        }),
    }
</script>

<style>
    a:hover {
        text-decoration: none;
    }
</style>