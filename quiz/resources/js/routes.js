import Login from "./components/Auth/Login";
import NewQuiz from "./components/quiz/NewQuiz";
import QuizList from "./components/quiz/QuizList";
import QuizView from "./components/quiz/QuizView";
import NewQuestion from "./components/question/NewQuestion";
import SignUp from "./components/Auth/SignUp";
import QuizPlay from "./components/quiz/QuizPlay";
import Logout from "./components/Auth/Logout";
import Home from "./components/Home";

const routes = [
    {
        path: '/',
        name: 'default',
        component: Home,
    },
    {
        path: '/signup',
        name: 'sign up',
        component: SignUp,
    },
    {
        path: '/login',
        name: 'login',
        component: Login,
    },
    {
        path: '/logout',
        name: 'logout',
        component: Logout,
    },
    {
        path: '/new-quiz',
        name: 'new quiz',
        component: NewQuiz
    },
    {
        path: '/quizzes',
        name: 'list of quizzes',
        component: QuizList
    },
    {
        path: '/quizzes/:quizId',
        name: 'show single quiz',
        component: QuizView
    },
    {
        path: '/quizzes/:quizId/new-question',
        name: 'add question to quiz',
        component: NewQuestion,
        props: (route) => {
            const props = {...route.params};
            props.quizId = +props.quizId;
            return props;
        }
    },
    {
        path: '/quizzes/:quizId/play',
        name: 'play quiz',
        component: QuizPlay,
        props: (route) => {
            const props = {...route.params};
            props.quizId = +props.quizId;
            return props;
        }
    }
];

export default routes;