<template>
    <v-form v-model="validForm">
        <v-row>
            <v-col cols="12">
                <p>Answer (Checked = true, unchecked = false): </p>
                <v-checkbox v-model="value.isCorrect"
                            color="green"/>
            </v-col>
        </v-row>
    </v-form>
</template>

<script>
    export default {
        name: "AnswerFormYesNo",
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