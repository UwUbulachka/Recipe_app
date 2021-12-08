require "test_helper"

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:sasha)
  end

  test "Profile" do
    get user_path(@user)
    assert_select 'title', full_title(@user.name)
    assert_select 'h2', text: @user.name
    assert_select 'h2', img: @user.avatar
    assert_match @user.posts.count.to_s, response.body
    assert_select 'ul.pagination'
    @user.posts.paginate(page: 1, per_page: 10).each do |post|
      assert_match post.content, response.body
    end  
  end
end
