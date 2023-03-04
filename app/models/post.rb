class Post < ApplicationRecord

    include AASM
    audited

    belongs_to :user
    has_many :votes, through: :users

    validates :post_content, presence: true
    validates :title, presence: true, length: { maximum: 500}
    

end
