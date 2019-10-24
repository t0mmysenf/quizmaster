<template>
    <v-form v-model="validForm">
        <v-row>
            <v-col>
                <v-text-field v-model="value.title"
                              label="Title of Question"
                              :disabled="disableFields"
                              @change="$emit('input', value)"
                              :rules="[v => !!v || 'Title is required']"
                              color="green"
                              autofocus
                              required>
                </v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-text-field v-model="value.questionText"
                              label="Actual Question"
                              :disabled="disableFields"
                              @change="$emit('input', value)"
                              :rules="[v => !!v || 'Question is required']"
                              color="green"
                              required>
                </v-text-field>
            </v-col>
        </v-row>
    </v-form>
</template>

<script>
    export default {
        name: "QuestionForm",
        props: {
            value: Object,
            disableFields: Boolean
        },
        data: () => ({
            validForm: false,
        }),
        watch: {
            validForm: function (newValidity) {
                this.$emit('validation', newValidity);
            }
        }
    }
</script>

<style scoped>

</style>