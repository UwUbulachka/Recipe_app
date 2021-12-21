require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup 
    @user = User.new(name: "Sasha", email: "sasha@exemple.com", password: "foobar", password_confirmation: "foobar")
  end 

  test "user must be valid" do 
    assert @user.valid?
  end 

  test "name should be present" do 
    @user.name = " "
    assert_not @user.valid?
  end

  test "email should be present" do 
    @user.email = " "
    assert_not @user.valid?
  end
    
  test "name must not exceed 50 characters" do 
    @user.name = "a" * 51
    assert_not @user.valid?
  end  

  test "email must not exceed 50 characters" do 
    @user.email = "a" * 244 + "@exemple.com"
    assert_not @user.valid?
  end 

  test "email with valid values" do 
    valid_email = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org 
                     first.last@foo.jp alice+bob@baz.cn]
    valid_email.each do |valid_adress|
      @user.email = valid_adress
      assert  @user.valid? 
    end 
  end  

  test "email with invalid values" do 
    invalid_email = %w[user@example,com user_at_foo.org user.name@example.
                       foo@bar_baz.com foo@bar+baz.com]
    invalid_email.each do |invalid_adress|
      @user.email = invalid_adress
      assert_not @user.valid? 
    end   
  end  

  test "email must be unique" do 
    duplicate_user = @user.dup 
    duplicate_user.email = @user.email.upcase 
    @user.save 
    assert_not duplicate_user.valid?
  end  

  test "email must be saved in lower case" do 
    down_case = "Foo@ExAMPle.CoM" 
    @user.email = down_case
    @user.save
    assert_equal down_case.downcase, @user.reload.email
  end  

  test "minimum password length" do 
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end 

  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

  test "associated microposts should be destroyed" do 
    @user.save
    meat = Category.create(name: 'meat')
    time = Time.now
    @user.posts.create(title: "lorem ipsum", 
                       content: "Lorem ipsum", 
                       category: meat, 
                       image: File.open(Rails.root.join('app', 'assets', 'images', 'pizza.jpg')),
                       cooking_time: time, preparation_time: time)
    assert_difference 'Post.count', -1 do 
      @user.destroy
    end  
  end 

  test "should follow and unfollow a user" do
    sasha = users(:sasha)
    masha = users(:masha)
    assert_not sasha.following?(masha)
    sasha.follow(masha)
    assert sasha.following?(masha)
    assert masha.followers.include?(sasha)
    sasha.unfollow(masha)
    assert_not sasha.following?(masha)
  end  

test "feed should have the right posts" do
    sasha = users(:sasha)
    masha = users(:masha)
    lana  = users(:lana)
    lana.microposts.each do |post_following|
      assert sasha.feed.include?(post_following)
    end
    sasha.microposts.each do |post_self|
      assert sasha.feed.include?(post_self)
    end
    masha.microposts.each do |post_unfollowed|
      assert_not sasha.feed.include?(post_unfollowed)
    end
  end
end

 