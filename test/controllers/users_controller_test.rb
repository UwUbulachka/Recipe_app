require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
  	@user = users(:sasha)
  	@oser = users(:masha)
  end

  test "should redirect index when not logged in" do 
    get users_path
    assert_redirected_to login_path
  end 

  test "should get signup" do
  	get signup_path
  	assert_response :success
  end

  test "should redirect edit when not logged in" do 
    get edit_user_path(@user), params: {id: @user}
    assert_not flash.empty?
    assert_redirected_to login_url
  end 	

  test "should redirect update when not logged in" do
    patch user_path(@user), params: {id: @user, email: @user.email, avatar: @user.avatar }
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect edit when logged in as wrong user" do 
    log_in_as(@user)
    get edit_user_path(@oser), params: {id: @user}
    assert flash.empty?
    assert_redirected_to root_url
  end

    test "should redirect update when logged in as wrong user" do 
    log_in_as(@oser)
    patch user_path(@user), params: {id: @user, email: @user.email, avatar: @user.avatar}
    assert flash.empty?
    assert_redirected_to root_url
  end	
end
