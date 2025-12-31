class Question < ApplicationRecord
  self.primary_key = 'question_id'

  belongs_to :lesson, foreign_key: :lesson_id, primary_key: :lesson_id
  has_many :user_question_progresses, foreign_key: :question_id, primary_key: :question_id, dependent: :destroy

  enum :question_type, {
    multiple_choice: 'MULTIPLE_CHOICE',
    short_answer: 'SHORT_ANSWER',
    flashcard: 'FLASHCARD',
    draw: 'DRAW'
  }

  validates :question_id, presence: true, uniqueness: true
  validates :lesson_id, presence: true
  validates :question_type, presence: true
end
