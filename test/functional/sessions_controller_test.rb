require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
	test "should get new" do
		get :new
		assert_response :success
	end
	
	test "should login" do
		dave = users(:one)
		post :create, :name => dave.name, :email => 'dave@mail.com', :password => 'foobar'
		assert_reditected_to admin_url
		assert_equal dave.id session[:user_id]
	end
	
	test "should fail login" do
		dave = users(:one)
		post :create, :email => dave.email, :password => 'wrong'
		assert_reditected_to login_url
  end

  test "should logout" do
    delete :destroy
    assert_redirected_to store_url
  end
end
