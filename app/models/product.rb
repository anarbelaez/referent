class Product < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :name, :price, :size, :category, :genre, :user, presence: true
  validates :name, length: { minimum: 6 }
  validates :description, length: { maximum: 200 }
  validates :price, numericality: { greater_than: 0 }
  validates :size, inclusion: { in: %w[XS S M L XL] }
  validates :category, inclusion: { in: %w[top bottom dresses shoes accesories] }
  validates :genre, inclusion: { in: %w[women men kids unisex] }
  validates :status, inclusion: [true, false] # True - Disponible, False - Vendido

  scope :availables, -> { where(status: true) }
end
