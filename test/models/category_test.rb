require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  def setup 
    @category = Category.new(name: "Мясо")
  end 

  test "category must be valid" do 
    assert @category.valid?
  end 

  test "category should be present" do 
    @category.name = " "
    assert_not @category.valid?
  end

  test "category must not exceed 20 characters" do 
    @category.name = "a" * 21
    assert_not @category.valid?
  end 
end
