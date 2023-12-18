# app/controllers/messages_controller.rb
class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @received_messages = current_user.received_messages
    @sent_messages = current_user.sent_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.sender = current_user

    if @message.save
      redirect_to messages_path, notice: 'Message sent successfully.'
    else
      render :new
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :recipient_id)
  end
end
