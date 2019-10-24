import axios from "axios";

const baseDomain = "http://localhost";
const baseURL = `${baseDomain}/api`;

export default axios.create({
    baseURL,
    headers: {'Authorization': `Bearer ${window.localStorage.getItem('token')}`}
});