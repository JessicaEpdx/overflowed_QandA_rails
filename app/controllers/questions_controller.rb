class QuestionsController < ApplicationController
  def index
    @all_questions = Question.all
    @questions = current_user.questions
    @results = Question.search(params[:criteria])
    @categories = Category.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = current_user.questions.new
    @categories = Category.all()
  end

  def create
    category = Category.find(params[:question][:category_id])
    @question = current_user.questions.new(question_params)
    @question.category_id = category.id
    if @question.save
      flash[:notice] = "Great Question!"
      redirect_to questions_path
    else
      flash[:alert] = "Sorry, try again."
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.answers.each do |answer|
      answer.destroy
    end
    @question.destroy
    redirect_to questions_path
  end

  private
  def question_params
    params.require(:question).permit(:title, :description)
  end
end
