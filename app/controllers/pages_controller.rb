class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  layout 'public'
  def home
  end

  def show
    render template: "pages/question"
  end
end
