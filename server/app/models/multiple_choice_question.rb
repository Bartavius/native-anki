class MultipleChoiceQuestion < ApplicationRecord
  self.primary_key = 'mcq_id'

  has_many :multiple_choice_answers, foreign_key: :question_id, primary_key: :mcq_id, dependent: :destroy
  belongs_to :correct_answer, class_name: 'MultipleChoiceAnswer', foreign_key: :correct_answer_id, primary_key: :answer_id, optional: true

  validates :mcq_id, presence: true, uniqueness: true
  validates :prompt, presence: true
  validates :correct_answer_id, presence: true
end
