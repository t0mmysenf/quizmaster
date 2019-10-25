import axios from "axios";

const baseURL = `/api`;

export default axios.create({
    baseURL,
    headers: {'Authorization': `Bearer ${window.localStorage.getItem('token')}`}
});