require "test_helper"

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:sasha)
  end  
  
  test "unsuccessful edit" do 
    get edit_user_path(@user)
    assert_template 'users/edit'
    assert_no_difference 'User.count' do 
      patch user_path(@user), params: {user: {name: "", email: "user@invalid", password: "foo", password_confirmation: "bar"} }
    end  
    assert_template 'users/edit'
    assert_select 'div#error_explanation' 
    assert_select 'div.field_with_errors'
  end 

end
