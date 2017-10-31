class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_action :authenticate_user!

  protect_from_forgery with: :exception
end
