

export interface User {
  username: string; // unique identifier
  password: string; // hashed string
  email: string;
  createdAt: Date;
  updatedAt: Date;
}

export enum QuestionType {
  MULTIPLE_CHOICE = 'MULTIPLE_CHOICE',
  SHORT_ANSWER = 'SHORT_ANSWER',
  FLASHCARD = 'FLASHCARD',
  DRAW = 'DRAW'
}

export interface Lesson {
  lessonId: string; // unique identifier
  title: string;
  description: string; // tutorial content in markdown
}

export interface UserLessonProgress {
  username: string; // reference to USER
  lessonId: string; // reference to LESSON
  lastReviewed: Date;
}

export interface UserQuestionProgress {
  username: string; // reference to USER
  questionId: string; // reference to QUESTION
  lastReviewed: Date;
  timesReviewed: number;
  numberCorrect: number;
}

export interface Question {
  lessonId: string; // reference to LESSON
  questionId: string; // reference to id of specific question type entry
  type: QuestionType;
}

export interface MultipleChoiceQuestion {
  mcqId: string; // unique identifier
  prompt: string; // question text
  correctAnswerId: string; // reference to MULTIPLE_CHOICE_ANSWERS
}

export interface MultipleChoiceAnswer {
  answerId: string; // unique identifier
  questionId: string; // reference to MULTIPLE_CHOICE_QUESTION
  text: string; // answer text
}

export interface Draw {
  drawId: string; // unique identifier
  imageUrl: string; // display stroke order at adjustable opacity
  description: string; // translation
}

export interface Flashcard {
  id: string; // unique identifier
  front: string; // character or word
  back: string; // translation or definition
}

export interface ShortAnswer {
  shortAnswerId: string; // unique identifier
  prompt: string; // question text
  correctAnswer: string; // expected answer; not strictly enforced
}