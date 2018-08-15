class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
  has_many :slides, dependent: :destroy
  validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  validates :username, uniqueness: true, length: { maximum: 20 }
end
