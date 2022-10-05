class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  multisearchable against: %i[brand description]
  PgSearch::Multisearch.rebuild(User)

  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_one_attached :photo

  validates :first_name, :last_name, presence: true, length: { minimum: 2 }

  # El valor por defecto del role es 2: fashion_lover
  validates :role, presence: true
  enum :role, { admin: 0, referent: 1, fashion_lover: 2 }

  # validates :brand, presence: true # , on: :update
  validates :description, length: { maximum: 200 }

  def name
    "#{first_name} #{last_name}"
  end
end
