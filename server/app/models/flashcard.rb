class Flashcard < ApplicationRecord
  validates :id, presence: true, uniqueness: true
  validates :front, presence: true
  validates :back, presence: true
end
