class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart

  helper_method :current_user, :current_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    require 'pry'; binding.pry
  end

  def current_admin?
    current_user && current_user.admin?
    require 'pry'; binding.pry
  end

  private

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
