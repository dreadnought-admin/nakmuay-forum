class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    audited

    has_many :posts
    has_many :watches, dependent: :destroy
    has_many :votes
    has_associated_audits

    has_secure_password
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
    validates :email, presence: true, uniqueness: true
    
end
