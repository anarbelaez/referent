class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :status, :payment, :delivery, :user, :product, presence: true
  validates :status, inclusion: [true, false] # True - Open, False - Closed

  enum :payment, { cash: 0, 'Debit Card': 1, 'Credit Card': 2 }, scopes: false
  enum :delivery, { 'home delivery': 0, 'delivery point': 1 }, scopes: false

  scope :open, -> { where(status: true) } # Puedo usar Order.open
  scope :closed, -> { where(status: false) } # Puedo usar Order.closed

  def mark_as_closed!
    update_attribute(:status, false)
  end
end
