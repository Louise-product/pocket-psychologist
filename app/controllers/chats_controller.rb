# If I am a logged in user:When I go to /chats/new -> I should see a form to start a new chat
# I click on the “Start Chat” form
# When my chat is successfully created  -> Then I should be redirected to /chats/:id -> And I should see my conversation screen


# If I am not logged in:
# I try to create a chat -> I should be redirected to the login page


class ChatsController < ApplicationController
  before_action :authenticate_user!
  # only logged in users can access new, create, show

  def new
    @chat = Chat.new
    @problems = current_user.problems
  end

  def create
    @problem = current_user.problems.find(params[:chat][:problem_id])
    @chat = Chat.new
    @chat.user = current_user
    @chat.problem = @problem

    if @chat.save
      # create the first assistant message
      @chat.messages.create!(
        role: "assistant",
        content: "Hello! I'm ready to help. What’s on your mind?"
      )
      redirect_to chat_path(@chat), notice: "Chat started!"
    else
      @problems = current_user.problems
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @chat = current_user.chats.find(params[:id])
    @messages = @chat.messages.order(:created_at)
    @message = Message.new
  end

  private

  def chat_params
    params.require(:chat).permit(:problem_id)
  end
end
