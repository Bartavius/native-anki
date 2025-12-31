class Draw < ApplicationRecord
  self.primary_key = 'draw_id'

  validates :draw_id, presence: true, uniqueness: true
  validates :image_url, presence: true
  validates :description, presence: true
end
