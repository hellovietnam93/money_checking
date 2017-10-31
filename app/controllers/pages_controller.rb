class PagesController < ApplicationController
  def show
    @page = params[:page]

    if valid_page?
      render "pages/#{@page}"
    else
      render file: "public/404.html", status: :not_found
    end
  end

  private

  def valid_page?
    File.exist? Pathname.new(Rails.root + "app/views/pages/#{@page}.html.erb")
  end
end
