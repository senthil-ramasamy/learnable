class HomeController < ApplicationController
  def index
    @courses = Course.includes(:user).order(created_at: :desc).limit(10)
  end
end
