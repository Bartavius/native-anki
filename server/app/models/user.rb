class User < ApplicationRecord
  has_secure_password

  has_many :user_lesson_progresses, foreign_key: :username, primary_key: :username, dependent: :destroy
  has_many :lessons, through: :user_lesson_progresses
  has_many :user_question_progresses, foreign_key: :username, primary_key: :username, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
