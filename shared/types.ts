

/**
 * USER {
 * username: string (unique identifier)
 * password: hashed string
 * email: string
 * createdAt: Date
 * updatedAt: Date
 * }
 * 
 * enum QuestionType {
 * MULTIPLE_CHOICE,
 * SHORT_ANSWER,
 * FLASHCARD,
 * DRAW
 * }
 * 
 * LESSON {
 * lessonId: string (unique identifier)
 * title: string
 * description: string (tutorial content in markdown?)
 * }
 * 
 * USER_LESSON_PROGRESS {
 * username: string (reference to USER)
 * lessonId: string (reference to LESSON)
 * lastReviewed: Date
 * }
 * 
 * USER_QUESTION_PROGRESS {
 * username: string (reference to USER)
 * questionId: string (reference to QUESTION)
 * lastReviewed: Date
 * timesReviewed: number
 * numberCorrect: number
 * }
 * 
 * QUESTION {
 * lessonId: string (reference to LESSON)
 * questionId: string (reference to id of specific question type entry
 * type: QuestionType
 * }
 * 
 * MULTIPLE_CHOICE_QUESTION {
 * mcqId: string (unique identifier)
 * prompt: string (question text)
 * correctAnswerId: string (reference to MULTIPLE_CHOICE_ANSWERS)
 * }
 * 
 * MULTIPLE_CHOICE_ANSWERS {
 * answerId: string (unique identifier)
 * questionId: string (reference to MULTIPLE_CHOICE_QUESTION)
 * text: string (answer text)
 * }
 * 
 * DRAW {
 * drawId: string (unique identifier)
 * imageUrl: string (display stroke order at adjustable opacity)
 * description: string (translation)
 * }
 * 
 * FLASHCARD {
 * id: string (unique identifier)
 * front: string (character or word)
 * back: string (translation or definition)
 * }
 * 
 * SHORT_ANSWER {
 * shortAnswerId: string (unique identifier)
 * prompt: string (question text)
 * correctAnswer: string (expected answer; not strictly enforced)
 * }
 */