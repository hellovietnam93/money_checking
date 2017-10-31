class CategoriesController < ApplicationController
  before_action :load_category, only: %i(edit update destroy)

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params.merge(creator_id: current_user.id)

    if category.save
      flash[:success] = flash_message "created"
      redirect_to categories_path
    else
      flash.now[:warning] = flash_message "not_created"
      render :new
    end
  end

  def edit; end

  def update
    if category.update_attributes category_params
      flash[:success] = flash_message "updated"
      redirect_to categories_path
    else
      flash.now[:warning] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if category.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:warning] = flash_message "not_deleted"
    end
    redirect_to categories_path
  end

  private

  attr_reader :category, :categories

  def category_params
    params.require(:category).permit Category::ATTRIBUTE_PARAMS
  end

  def load_category
    @category = Category.find_by id: params[:id]

    return if category
    flash[:warning] = flash_message "record_not_found"
    redirect_to admin_root_path
  end
end
