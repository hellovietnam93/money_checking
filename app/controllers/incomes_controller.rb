class IncomesController < ApplicationController
  before_action :load_income, only: %i(edit update destroy)
  before_action :load_data, only: %i(index new edit)
  before_action :load_month, only: :index

  def index
    @incomes =
      if params[:category_id].present?
        current_user.incomes.includes(:month, :category)
          .where category_id: params[:category_id]
      elsif params[:month_id].present?
        @month = @months.find{|month| month.last == params[:month_id].to_i}
        current_user.incomes.includes(:month, :category)
          .where month_id: params[:month_id]
      elsif params[:category_id].present? && params[:month_id].present?
        @month = @months.find{|month| month.last == params[:month_id].to_i}
        current_user.incomes.includes(:month, :category)
          .where category_id: params[:category_id], month_id: params[:month_id]
      else
        current_user.incomes.includes(:month, :category)
          .where month_id: @month.last
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
    @months = Month.all.collect{|month| [month.value, month.id]}
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

  def load_month
    lastest_month = Month.last
    @month = [I18n.l(lastest_month.value, format: :month), lastest_month.id]
  end
end
