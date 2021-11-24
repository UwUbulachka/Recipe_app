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
end
