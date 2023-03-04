class UserWithPostsSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role
  has_many :posts, dependent: :destroy
end
