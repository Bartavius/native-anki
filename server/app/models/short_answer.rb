class ShortAnswer < ApplicationRecord
  self.primary_key = 'short_answer_id'

  validates :short_answer_id, presence: true, uniqueness: true
  validates :prompt, presence: true
  validates :correct_answer, presence: true
end
