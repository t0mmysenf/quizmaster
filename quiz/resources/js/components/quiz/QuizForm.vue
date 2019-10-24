<template>
    <v-form v-model="validForm">
        <v-row>
            <v-col>
                <v-text-field v-model="value.title"
                              label="Title of Quiz"
                              :disabled="disableFields"
                              @change="$emit('input', value)"
                              :rules="[v => !!v || 'Title is required']"
                              color="green"
                              required>
                </v-text-field>
            </v-col>
        </v-row>
        <v-row>
            <v-col>
                <v-textarea v-model="value.description"
                            label="Description for Quiz"
                            :disabled="disableFields"
                            @change="$emit('input', value)"
                            color="green"
                            required>
                </v-textarea>
            </v-col>
        </v-row>
    </v-form>
</template>

<script>
    export default {
        name: "QuizForm",
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