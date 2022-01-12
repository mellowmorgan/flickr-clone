class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  # def current_user
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #   end
  # end
end

