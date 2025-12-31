class Lesson < ApplicationRecord
  self.primary_key = 'lesson_id'

  has_many :questions, foreign_key: :lesson_id, primary_key: :lesson_id, dependent: :destroy
  has_many :user_lesson_progresses, foreign_key: :lesson_id, primary_key: :lesson_id, dependent: :destroy
  has_many :users, through: :user_lesson_progresses

  validates :lesson_id, presence: true, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true
end
