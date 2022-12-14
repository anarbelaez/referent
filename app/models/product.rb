class Product < ApplicationRecord
  include PgSearch::Model

  belongs_to :user
  has_many :orders
  has_one_attached :photo

  pg_search_scope :search,
                  against: %i[name description],
                  associated_against: { user: [:brand] },
                  using: { tsearch: { prefix: true } }

  validates :name, :price, :size, :category, :genre, :user, :status, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { maximum: 200 }
  validates :price, numericality: { greater_than: 0 }
  validates :status, inclusion: [true, false] # True - Avaliable, False - Sold

  # Con suffix: true, podemos usar Product.small_size
  enum :size, { small: 0, medium: 1, large: 2, unique: 3 }, suffix: true

  enum :color, { black: 0, white: 1, red: 2, orange: 3, yellow: 4,
                 green: 5, blue: 6, indigo: 7, purple: 8, multicolor: 9 }, suffix: true

  enum :category, { top: 0, bottom: 1, dresses: 2, accesories: 3, shoes: 4 }, suffix: true

  enum :genre, { women: 0, men: 1, unisex: 2 }

  scope :available, -> { where(status: true).order(created_at: :desc) }
  scope :sold, -> { where(status: false) }

  def brand
    user.brand
  end

  def available?
    status
  end

  def mark_as_sold!
    update_attribute(:status, false)
  end
end
