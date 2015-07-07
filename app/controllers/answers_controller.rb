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

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if params[:format] == "up"
      @answer.score += 1
      @answer.save
    else
      @answer.score -= 1
      @answer.save
    end
    redirect_to question_path(@question)
  end

  private
  def answer_params
    params.require(:answer).permit(:description)
  end
end
