class QuestionsController < ApplicationController
  def index
    @questions = current_user.questions
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.new
  end

  def create
  end
end
