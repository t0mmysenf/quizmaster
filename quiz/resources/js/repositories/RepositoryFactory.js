import QuizRepository from './QuizRepository';
import QuestionRepository from "./QuestionRepository";
import AnswerRepository from "./AnswerRepository";
import UserRepository from "./UserRepository";

const repositories = {
    quizzes: QuizRepository,
    users: UserRepository,
    questions: QuestionRepository,
    answers: AnswerRepository,
    // other repositories...
};

export const RepositoryFactory = {
    get: name => {
        const repository = repositories[name];
        return repository;
    }
};