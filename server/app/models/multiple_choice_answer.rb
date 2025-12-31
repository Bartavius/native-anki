class MultipleChoiceAnswer < ApplicationRecord
  self.primary_key = 'answer_id'

  belongs_to :multiple_choice_question, foreign_key: :question_id, primary_key: :mcq_id

  validates :answer_id, presence: true, uniqueness: true
  validates :question_id, presence: true
  validates :text, presence: true
end
