class IncomesController < ApplicationController
  before_action :load_income, only: %i(edit update destroy)
  before_action :load_data, only: %i(index new edit)

  def index
    @incomes =
      if params[:category_id].present?
        current_user.incomes.includes(:category)
          .where category_id: params[:category_id]
      elsif params[:month].present?
        month = params[:month].split("-")
        current_user.incomes.includes(:category)
          .in_month month.first, month.last
      elsif params[:category_id].present? && params[:month].present?
        month = params[:month].split("-")
        current_user.incomes.includes(:category)
          .where(category_id: params[:category_id])
          .in_month month.first, month.last
      else
        current_user.incomes.includes(:category)
          .in_month Date.today.year, Date.today.month
      end
    load_statistic_data
  end

  def new
    @income = Income.new
  end

  def create
    @income = current_user.incomes.new income_params

    if income.save
      flash[:success] = flash_message "created"
      redirect_to incomes_path
    else
      return_fails_data
      render :new
    end
  end

  def edit; end

  def update
    if income.update_attributes income_params
      flash[:success] = flash_message "updated"
      redirect_to incomes_path
    else
      return_fails_data
      render :edit
    end
  end

  def destroy
    if income.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:warning] = flash_message "not_deleted"
    end
    redirect_to incomes_path
  end

  private

  attr_reader :income, :incomes

  def income_params
    params.require(:income).permit Income::ATTRIBUTE_PARAMS
  end

  def load_income
    @income = Income.find_by id: params[:id]

    return if income
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

  def load_statistic_data
    @income_statistics =
      Statistics::BaseStatistic.new(data: @incomes, categories: @categories)
        .execute
  end
end
