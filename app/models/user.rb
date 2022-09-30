class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  validates :brand, uniqueness: true # , on: :update
  validates :description, length: { maximum: 200 }

  has_many :products
  has_many :orders

  scope :referents, -> { where(role: true).select(:id, :brand, :description) }
  scope :fashion_lovers, -> { where.not(role: true) }

  def referent?
    role == true
  end

  def fashion_lover?
    role == false
  end
end
