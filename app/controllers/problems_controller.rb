class ProblemsController < ApplicationController
  before_action :authenticate_user!

  def new
    @problem = current_user.problems.new
  end

  def create
    @problem = current_user.problems.build(problem_params)

    if @problem.save
      redirect_to new_chat_path(problem_id: @problem.id), notice: "Problem created! Now start your chat."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @problem = Problem.find(params[:id])
  end

  def index
    @problems = current_user.problems
  end

  private

  def problem_params
    params.require(:problem).permit(:title, :content)
  end
end
