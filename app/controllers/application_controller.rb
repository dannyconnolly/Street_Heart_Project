class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery

  protected
  # @reference Laptoshop Tutorial 2, Wesley Gorman
  def current_user
    return unless cookies[:auth_token]
    @current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end

  helper_method :current_user

  # @reference Agile Web Develoment with Rails book pg 198
  def authorize
    unless admin?
      flash[:notice] = "Please login or register to continue"
      redirect_to login_path
      false
    end
  end

  # @reference Agile Web Develoment with Rails book pg 198
  def admin?
    logged_in? && current_user.admin?
  end

  helper_method :admin?

  # @reference Laptoshop Tutorial 2, Wesley Gorman
  def authenticate
    logged_in? ? true : access_denied
  end

  # @reference Laptoshop Tutorial 2, Wesley Gorman
  def logged_in?
    current_user.is_a? User
  end

  helper_method :logged_in?

  # @reference Laptoshop Tutorial 2, Wesley Gorman
  def access_denied
    redirect_to login_url, :notice => "Please log in to continue" and return false
  end

  private
  # @reference http://railscasts.com/episodes/142-paypal-notifications
  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

  # @reference Agile Web Develoment with Rails book pg 102
  def current_wishlist
    Wishlist.find(session[:wishlist_id])
  rescue ActiveRecord::RecordNotFound
    wishlist = Wishlist.create
    session[:wishlist_id] = wishlist.id
    wishlist
  end
end

