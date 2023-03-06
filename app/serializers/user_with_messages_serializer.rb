class UserWithMessagesSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :role
  has_many :messages
end
