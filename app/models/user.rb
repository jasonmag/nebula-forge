class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  has_one :user_details
  has_many :user_companies
  has_many :companies, through: :user_companies
  belongs_to :role, class_name: 'UserRole'
end
