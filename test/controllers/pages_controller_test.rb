require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  def setup 
    @title = "Вкусные рецепты"
  end  

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Вкусные рецепты"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "О сайте | #{@title}"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "Контакты | #{@title}"
  end
end
