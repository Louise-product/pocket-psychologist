class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    if user_signed_in?
      redirect_to new_problem_path
    else
      redirect_to new_user_registration_path
    end
  end

  def new
  end

  def dashboard
    @problems = current_user.problems

  end

end
