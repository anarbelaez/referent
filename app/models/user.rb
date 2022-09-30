class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }
  # validates :brand, presence: true # , on: :update
  validates :description, length: { maximum: 200 }

  has_many :products, dependent: :delete_all
  has_many :orders, dependent: :delete_all

  has_one_attached :photo

  scope :referents, -> { where(role: true).select(:id, :brand, :description) }
  scope :fashion_lovers, -> { where.not(role: true) }

  def referent?
    role == true
  end

  def fashion_lover?
    role == false
  end
end
