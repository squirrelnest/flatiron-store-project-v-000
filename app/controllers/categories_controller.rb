class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.first
  end

end
