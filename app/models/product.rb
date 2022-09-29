class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, :price, :stock, :size, :category, :genre, :user, presence: true
  validates :name, length: { minimum: 6 }
  validates :description, length: { maximum: 200 }
  validates :price, numericality: { greater_than: 0 }
  validates :stock, numericality: { only_integer: true, greater_than: 0 }
  validates :size, inclusion: { in: %w[XS S M L XL] }
  validates :category, inclusion: { in: %w[TOP BOTTOM DRESSES SHOES ACCESORIES] }
  validates :genre, inclusion: { in: %w[WOMEN MEN KIDS UNISEX] }
end
