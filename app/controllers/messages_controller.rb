class MessagesController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @message = Message.where(["sender_id = ? or receiver_id = ?", current_user.id, current_user.id]).order("title DESC")
  end

  def new
     @message = Message.new
     @receiver_id = params[:receiver_id]
  end

  def create
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.save
    redirect_to messages_path
  end

  private
    def message_params
          params.require(:message).permit(:title, :content, :receiver_id)
    end
end