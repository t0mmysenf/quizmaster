import QuizRepository from './QuizRepository';
import QuestionRepository from "./QuestionRepository";
import AnswerRepository from "./AnswerRepository";

const repositories = {
    quizzes: QuizRepository,
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