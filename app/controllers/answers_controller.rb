class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.new(answer_params)
    if @answer.save
      current_user.answers.push(@answer)
      flash[:notice] = "Great Answer!"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Wrong!"
      render :new
    end
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
