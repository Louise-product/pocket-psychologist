class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  def new
    @message = @chat.messages.new
  end

  def create
    @message = @chat.messages.build(message_params)
    @message.role = "user" # every message created here is from the user

    if @message.save

      redirect_to @chat, notice: "Message sent!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_chat
    @chat = current_user.chats.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
