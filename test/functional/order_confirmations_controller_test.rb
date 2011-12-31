require 'test_helper'

class OrderConfirmationsControllerTest < ActionController::TestCase
  setup do
    @order_confirmation = order_confirmations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_confirmations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_confirmation" do
    assert_difference('OrderConfirmation.count') do
      post :create, :order_confirmation => @order_confirmation.attributes
    end

    assert_redirected_to order_confirmation_path(assigns(:order_confirmation))
  end

  test "should show order_confirmation" do
    get :show, :id => @order_confirmation.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @order_confirmation.to_param
    assert_response :success
  end

  test "should update order_confirmation" do
    put :update, :id => @order_confirmation.to_param, :order_confirmation => @order_confirmation.attributes
    assert_redirected_to order_confirmation_path(assigns(:order_confirmation))
  end

  test "should destroy order_confirmation" do
    assert_difference('OrderConfirmation.count', -1) do
      delete :destroy, :id => @order_confirmation.to_param
    end

    assert_redirected_to order_confirmations_path
  end
end
