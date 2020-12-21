class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze

  validates :email, uniqueness: { case_sensitive: true }
  validates_format_of :password, with: PASSWORD_REGEX, message: 'include both letters and numbers'
  validates :username, presence: true
end
