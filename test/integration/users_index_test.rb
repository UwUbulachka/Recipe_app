require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest

  def setup
    @admin = users(:sasha)
    @masha = users(:masha)
  end

  test "index as admin including pagination and delete links" do 
    log_in_as(@admin)
    get users_path
    assert_template 'users/index'
    assert_select 'ul.pagination'
    first_page_of_users = User.paginate(page: 1, per_page: 15)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin 
        assert_select 'a[href=?]', user_path(user), text: "удалить", method: :delete
    end  
  end  
    assert_difference 'User.count', -1 do 
      delete user_path(@masha)
    end
  end  

  test "index as non-admin" do 
    log_in_as(@masha)
    get users_url
    assert_select 'a', text: "удалить", count: 0 
  end  

end
