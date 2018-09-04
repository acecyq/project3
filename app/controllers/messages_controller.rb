class MessagesController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @message = Message.where(["sender_id = ? or receiver_id = ?", current_user.id, current_user.id]).order("id DESC")
  end

  def new
    @message = Message.new
    if params[:message_id]
      @old = Message.find(params[:message_id])
    else
      @receive = params[:receiver_id]
    end
    session[:reply_message] = params[:message_id]
  end

  def create
    Message.find(session[:reply_message]).update(read: false)
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.save
    session[:reply_message] = nil
    redirect_to messages_path
  end

  private
    def message_params
      params.require(:message).permit(:title, :content, :receiver_id)
    end
end