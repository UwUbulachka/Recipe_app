require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:sasha)
  end  
  
  test "unsuccessful edit" do 
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    assert_no_difference 'User.count' do 
      patch user_path(@user), params: {user: {name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"} }
    end  
    assert_template 'users/edit'
    assert_select 'div#error_explanation' 
    assert_select 'div.field_with_errors'
  end 

    test "successful edit" do 
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Dasha"
    email = "foo@bar.com"  
    patch user_path(@user), params: {user: {name: name, email: email, password: "", password_confirmation: "", avatar: 'kot.png'} } 
    assert_not flash.empty?
    assert_redirected_to @user 
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end
