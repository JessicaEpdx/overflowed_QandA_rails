class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
  end
end
