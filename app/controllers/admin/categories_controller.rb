class Admin::CategoriesController < ApplicationController
  http_basic_authentication_with name: "Jungle", password: "book"

  def index
    @categories = Category.all
  end

  #make new category
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to [:admin, :categories], notice: "Category added to list."
    else
      render :new
    end
  end

  def new
    @category = Category.new
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: "Category deleted."
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end
end
