class OutcomesController < ApplicationController
  before_action :load_outcome, only: %i(edit update destroy)
  before_action :load_data, only: %i(index new edit)

  def index
    @outcomes =
      if params[:category_id].present?
        current_user.outcomes.includes(:category)
          .where(category_id: params[:category_id]).order :month
      elsif params[:month].present?
        month = params[:month].split("-")
        current_user.outcomes.includes(:category)
          .in_month(month.first, month.last).order :month
      elsif params[:category_id].present? && params[:month].present?
        month = params[:month].split("-")
        current_user.outcomes.includes(:category)
          .where(category_id: params[:category_id])
          .in_month(month.first, month.last).order :month
      else
        current_user.outcomes.includes(:category)
          .in_month(Date.today.year, Date.today.month)
          .order :month
      end
    load_statistic_data
  end

  def new
    @outcome = Outcome.new
  end

  def create
    @outcome = current_user.outcomes.new outcome_params

    if outcome.save
      flash[:success] = flash_message "created"
      redirect_to outcomes_path
    else
      return_fails_data
      render :new
    end
  end

  def edit; end

  def update
    if outcome.update_attributes outcome_params
      flash[:success] = flash_message "updated"
      redirect_to outcomes_path
    else
      return_fails_data
      render :edit
    end
  end

  def destroy
    if outcome.destroy
      flash[:success] = flash_message "deleted"
    else
      flash[:warning] = flash_message "not_deleted"
    end
    redirect_to outcomes_path
  end

  private

  attr_reader :outcome, :outcomes

  def outcome_params
    params.require(:outcome).permit Outcome::ATTRIBUTE_PARAMS
  end

  def load_outcome
    @outcome = Outcome.find_by id: params[:id]

    return if outcome
    flash[:warning] = flash_message "record_not_found"
    redirect_to root_path
  end

  def load_data
    @categories = Category.all.order(:name).collect{|category| [category.name, category.id]}
  end

  def return_fails_data
    load_data
    flash.now[:warning] = flash_message "not_#{params[:action]}d"
  end

  def load_statistic_data
    @outcome_statistics =
      Statistics::BaseStatistic.new(data: @outcomes, categories: @categories)
        .execute
  end
end
