class Message < ApplicationRecord
    validates :content, presence: true

    def self.new_message(params)
        browsed_user = User.find(params[:recipient_id])
        uuid = Match.where(user_id: params[:sender_id]).where(browsed_user_id: params[:recipient_id])[0][:pair_id]
        message = Message.create!(pair_id: uuid, sender_id: params[:sender_id], recipient_id: params[:recipient_id], content: params[:content])
        ActionCable.server.broadcast("chat_#{params[:recipient_id]}", "")
        ActionCable.server.broadcast("chat_#{params[:recipient_id]}#{params[:sender_id]}", message)
        return message
      end
      
end
