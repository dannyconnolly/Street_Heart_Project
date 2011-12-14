class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end

  helper_method :current_user

  def authorize
    unless admin?
      flash[:notice] = "Please login or register to continue"
      redirect_to store_path
      false
    end
  end

  def admin?
    logged_in? && current_user.admin?
  end

  helper_method :admin?

  def authenticate
    logged_in? ? true : access_denied
  end

  def logged_in?
    current_user.is_a? User
  end

  helper_method :logged_in?

  def access_denied
    redirect_to login_url, :notice => "Please log in to continue" and return false
  end

  private

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  def current_wishlist
    Wishlist.find(session[:wishlist_id])
  rescue ActiveRecord::RecordNotFound
    wishlist = Wishlist.create
    session[:wishlist_id] = wishlist.id
    wishlist
  end
end

