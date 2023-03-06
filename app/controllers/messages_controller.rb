class MessagesController < ApplicationController

    def index; end

    def create_message
        message = Message.new_message(params)
        render json: message, status: :created
    end 

    def create
        Message.create(content: params[:message])
        ActionCable.server.broadcast('messages', { messages: Message.all })
      end

end
