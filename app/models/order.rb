class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :status, :payment, :delivery, :user, :product, presence: true
  validates :status, inclusion: [true, false] # True - Entregado, False - No entregado
  validates :payment, inclusion: { in: %w[cash debit credit] }
  validates :delivery, inclusion: { in: ["Home delivery", "Shipping to a delivery point"] }

  scope :closed, -> { where(status: true) } # Puedo usar Order.closed
  scope :open, -> { where(status: false) } # Puedo usar Order.open
end
