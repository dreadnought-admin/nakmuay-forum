class User < ApplicationRecord
    audited

    has_many :posts
    has_many :watches, dependent: :destroy
    has_many :votes
    has_associated_audits

    has_secure_password
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: true
    validates :email, presence: true, uniqueness: true
    
end
