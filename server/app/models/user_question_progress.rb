class UserQuestionProgress < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username
  belongs_to :question, foreign_key: :question_id, primary_key: :question_id

  validates :username, presence: true
  validates :question_id, presence: true
  validates :last_reviewed, presence: true
  validates :times_reviewed, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :number_correct, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
