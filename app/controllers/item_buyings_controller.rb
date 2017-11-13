class ItemBuyingsController < ApplicationController
  before_action :load_item_buying, only: %i(edit update destroy)
  before_action :load_data, only: %i(new edit)

  def index
    @item_buyings = ItemBuying.all
  end

  def new
    @item_buying = ItemBuying.new
  end

  def create
    @item_buying = current_user.item_buyings.new item_buying_params

    if item_buying.save
      flash[:success] = flash_message "created"
      redirect_to item_buyings_path
    else
      return_fails_data
      render :new
    end
  end

  def edit; end

  def update
    if item_buying.update_attributes item_buying_params
      flash[:success] = flash_message "updated"
      redirect_to item_buyings_path
    else
      return_fails_data
      render :edit
    end
  end

  def destroy
    if item_buying.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:warning] = flash_message "not_deleted"
    end
    redirect_to item_buyings_path
  end

  private

  attr_reader :item_buying, :item_buyings

  def item_buying_params
    params.require(:item_buying).permit ItemBuying::ATTRIBUTE_PARAMS
  end

  def load_item_buying
    @item_buying = ItemBuying.find_by id: params[:id]

    return if item_buying
    flash[:warning] = flash_message "record_not_found"
    redirect_to root_path
  end

  def load_data
    @categories = Category.all.collect{|category| [category.name, category.id]}
  end

  def return_fails_data
    load_data
    flash.now[:warning] = flash_message "not_#{params[:action]}d"
  end
end
