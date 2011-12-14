require 'test_helper'

class WishlistsControllerTest < ActionController::TestCase
  setup do
    @wishlist = wishlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishlist" do
    assert_difference('Wishlist.count') do
      post :create, :wishlist => @wishlist.attributes
    end

    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should show wishlist" do
    get :show, :id => @wishlist.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wishlist.to_param
    assert_response :success
  end

  test "should update wishlist" do
    put :update, :id => @wishlist.to_param, :wishlist => @wishlist.attributes
    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should destroy wishlist" do
    assert_difference('Wishlist.count', -1) do
      delete :destroy, :id => @wishlist.to_param
    end

    assert_redirected_to wishlists_path
  end
end
