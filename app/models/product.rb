class Product < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[name description user]

  belongs_to :user
  has_many :orders
  has_one_attached :photo

  validates :name, :price, :size, :category, :genre, :user, :status, presence: true
  validates :name, length: { minimum: 5 }
  validates :description, length: { maximum: 200 }
  validates :price, numericality: { greater_than: 0 }
  validates :status, inclusion: [true, false] # True - Avaliable, False - Sold

  # Con suffix: true, podemos usar Product.small_size
  enum :size, { 'Small': 0, 'Medium': 1, 'Large': 2, 'Unique': 3 }, suffix: true

  enum :color, { 'Black': 0, 'White': 1, 'Red': 2, 'Orange': 3, 'Yellow': 4,
                 'Green': 5, 'Blue': 6, 'Indigo': 7, 'Purple': 8, 'Multicolor': 9 }, suffix: true

  enum :category, { 'Top': 0, 'Bottom': 1, 'Dresses': 2, 'Accesories': 3, 'Shoes': 4 }, suffix: true

  enum :genre, { 'Women': 0, 'Men': 1, Unisex: 2 }

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
