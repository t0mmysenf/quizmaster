import Axios from "axios";

const baseURL = `/api`;

export const axios = Axios.create({
    baseURL,
    headers: {'Authorization': `Bearer ${window.localStorage.getItem('token')}`}
});