class Review < ApplicationRecord
  belongs_to :user
  validates :rating, presence: true, acceptance: { accept: (1..5).to_a }, numericality: { only_integer: true }
  validates :content, length: { minimum: 5}
  has_rich_text :content
end
