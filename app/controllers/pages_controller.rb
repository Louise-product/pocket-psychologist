class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def new
  end

  def dashboard
    @problems = current_user.problems
    # @chats = current_user.problems.chats
    # @messages = current_user.problems.chats.messages
    # @chats.each do |chat|
    #   chat.title = @messages.first
    #   @title = chat.title 
    # end
  end

end
