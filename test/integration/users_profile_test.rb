require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:sasha)
  end

  test "Profile" do
    get user_path(@user)
    assert_select 'h1', text: @user.name
    assert_select 'h1', img: @user.avatar
 end

end
