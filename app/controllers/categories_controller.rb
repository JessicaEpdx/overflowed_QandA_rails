class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html { redirect_to questions_path}
      format.js
    end
  end
end
