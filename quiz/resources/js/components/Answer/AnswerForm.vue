<template>
    <v-form v-model="validForm">
        <v-row>
            <v-col cols="1">
                <v-checkbox v-model="value.isCorrect"
                            color="green"/>
            </v-col>
            <v-col cols="11">
                <v-text-field v-model="value.answerText"
                              label="Answer"
                              :disabled="disableFields"
                              @change="$emit('input', value)"
                              :rules="[v => !!v || 'Answer is required']"
                              hint="Check the box to mark this answer as correct."
                              color="green"
                              required>
                </v-text-field>
            </v-col>
        </v-row>
    </v-form>
</template>

<script>
    export default {
        name: "AnswerForm",
        props: {
            value: Object,
            disableFields: Boolean,
        },
        data: () => ({
            validForm: false
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