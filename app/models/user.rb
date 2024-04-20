class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true

  has_one :user_details, class_name: 'UserDetail'
  has_many :user_companies
  has_many :companies, through: :user_companies
  # belongs_to :role, class_name: 'UserRole'
  # belongs_to :author, class_name: 'User'

  # render avatar attachment
  has_one_attached :avatar

  # Get fullname
  def full_name
    "#{first_name} #{last_name}"
  end

end
