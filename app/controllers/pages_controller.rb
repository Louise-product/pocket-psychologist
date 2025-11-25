class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def new
  end

  def dashboard
    @problems = Problem.new
    @chat = Chat.new
    
  end

  private
   def problems_params
     
   end
end
