class QuestionsController < ApplicationController
  def index
    @all_questions = Question.all()
    @questions = current_user.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.new
  end

  def create
    @question = current_user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Great Question!"
      redirect_to user_questions_path
    else
      flash[:alert] = "Sorry, try again."
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
