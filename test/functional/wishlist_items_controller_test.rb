require 'test_helper'

class WishlistItemsControllerTest < ActionController::TestCase
  setup do
    @wishlist_item = wishlist_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlist_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishlist_item" do
    assert_difference('WishlistItem.count') do
      post :create, :product_id => products(:ruby).id
    end

    assert_redirected_to wishlist_path(assigns(:wishlist_item).wishlist)
  end

  test "should show wishlist_item" do
    get :show, :id => @wishlist_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wishlist_item.to_param
    assert_response :success
  end

  test "should update wishlist_item" do
    put :update, :id => @wishlist_item.to_param, :wishlist_item => @wishlist_item.attributes
    assert_redirected_to wishlist_item_path(assigns(:wishlist_item))
  end

  test "should destroy wishlist_item" do
    assert_difference('WishlistItem.count', -1) do
      delete :destroy, :id => @wishlist_item.to_param
    end

    assert_redirected_to wishlist_items_path
  end
end
