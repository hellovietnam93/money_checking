class OutcomesController < ApplicationController
  before_action :load_outcome, only: %i(edit update destroy)
  before_action :load_data, only: %i(new edit)

  def index
    @outcomes = Outcome.all
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
    redirect_to admin_root_path
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
