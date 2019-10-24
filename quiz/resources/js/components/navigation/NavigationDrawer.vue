<template>
    <v-navigation-drawer
            :value="value"
            @input="onInput"
            app
            clipped
    >
        <v-list dense>
            <v-list-item to="/">
                <v-list-item-action>
                    <v-icon>mdi-home</v-icon>
                </v-list-item-action>
                <v-list-item-content>
                    <v-list-item-title>Home</v-list-item-title>
                </v-list-item-content>
            </v-list-item>

            <v-list-item to="/quizzes">
                    <v-list-item-action>
                        <v-icon>mdi-home</v-icon>
                    </v-list-item-action>
                    <v-list-item-content>
                        <v-list-item-title>Quizzes</v-list-item-title>
                    </v-list-item-content>
            </v-list-item>

        </v-list>
    </v-navigation-drawer>
</template>

<script>
    export default {
        name: "NavigationDrawer",
        props: {
            value: Boolean,
        },
        methods: {
            onInput(value) {
                this.$emit('input', value);
            }
        }
    }
</script>

<style scoped>

</style>