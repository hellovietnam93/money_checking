class MonthsController < ApplicationController
  before_action :load_month, only: %i(edit update destroy)

  def index
    @months = Month.all
  end

  def new
    @month = Month.new
  end

  def create
    @month = current_user.months.new month_params

    if month.save
      flash[:success] = flash_message "created"
      redirect_to months_path
    else
      flash.now[:warning] = flash_message "not_created"
      render :new
    end
  end

  def edit; end

  def update
    if month.update_attributes month_params
      flash[:success] = flash_message "updated"
      redirect_to months_path
    else
      flash.now[:warning] = flash_message "not_updated"
      render :edit
    end
  end

  def destroy
    if month.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:warning] = flash_message "not_deleted"
    end
    redirect_to months_path
  end

  private

  attr_reader :month, :months

  def month_params
    params.require(:month).permit Month::ATTRIBUTE_PARAMS
  end

  def load_month
    @month = Month.find_by id: params[:id]

    return if month
    flash[:warning] = flash_message "record_not_found"
    redirect_to admin_root_path
  end
end
