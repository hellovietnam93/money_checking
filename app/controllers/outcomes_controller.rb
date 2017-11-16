class OutcomesController < ApplicationController
  before_action :load_outcome, only: %i(edit update destroy)
  before_action :load_data, only: %i(index new edit)
  before_action :load_month, only: :index

  def index
    @outcomes =
      if params[:category_id].present?
        current_user.outcomes.includes(:month, :category)
          .where category_id: params[:category_id]
      elsif params[:month_id].present?
        @month = @months.find{|month| month.last == params[:month_id].to_i}
        current_user.outcomes.includes(:month, :category)
          .where month_id: params[:month_id]
      elsif params[:category_id].present? && params[:month_id].present?
        @month = @months.find{|month| month.last == params[:month_id].to_i}
        current_user.outcomes.includes(:month, :category)
          .where category_id: params[:category_id], month_id: params[:month_id]
      else
        current_user.outcomes.includes(:month, :category)
          .where month_id: @month.last
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
    @months = Month.all.collect{|month| [I18n.l(month.value, format: :month), month.id]}
    @categories = Category.all.collect{|category| [category.name, category.id]}
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

  def load_month
    lastest_month = Month.last
    @month = [I18n.l(lastest_month.value, format: :month), lastest_month.id]
  end
end
