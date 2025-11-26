class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_chat

  SYSTEM_PROMPT = "You are a mental health coach"

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

  def instruction_context
    [SYSTEM_PROMPT, current_user.context].compact.join("\n\n")
  end
end
