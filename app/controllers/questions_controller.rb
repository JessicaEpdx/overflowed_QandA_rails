class QuestionsController < ApplicationController
  def index
    @all_questions = Question.all
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
    @question = current_user.questions.new(question_params)
    if params[:question][:category_id] != ""
      category = Category.find(params[:question][:category_id])
      @question.category_id = category.id
      if @question.save
        flash[:notice] = "Great Question!"
        redirect_to questions_path
      else
        flash[:alert] = "Sorry, try again."
        render :new
      end
    else
      flash[:alert] = "You must choose a category."
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update(question_params)
    if params[:question][:category_id] != ""
      category = Category.find(params[:question][:category_id])
      @question.category_id = category.id
      if @question.save
        flash[:notice] = "Your Question has been updated!"
        respond_to do |format|
          format.html { redirect_to question_path(@question)}
          format.js
        end
      else
        flash[:alert] = "You must have a title, description, and category"
        render :new
      end
    else
      flash[:alert] = "You must choose a category!"
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
