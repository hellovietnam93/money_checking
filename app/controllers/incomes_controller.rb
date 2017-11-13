class IncomesController < ApplicationController
  before_action :load_income, only: %i(edit update destroy)
  before_action :load_data, only: %i(new edit)

  def index
    @incomes = current_user.incomes.includes(:month, :category)
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
end
