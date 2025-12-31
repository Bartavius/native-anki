class UserLessonProgress < ApplicationRecord
  belongs_to :user, foreign_key: :username, primary_key: :username
  belongs_to :lesson, foreign_key: :lesson_id, primary_key: :lesson_id

  validates :username, presence: true
  validates :lesson_id, presence: true
  validates :last_reviewed, presence: true
end
