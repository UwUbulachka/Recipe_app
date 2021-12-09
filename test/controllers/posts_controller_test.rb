require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:pie)
  end 

  test "should redirect create when not logged in" do 
    assert_no_difference 'Post.count' do 
      post posts_url(@post), params: { post: { title: "Lorem ipsum", content: "Lorem ipsum"} }
    end 
    assert_redirected_to login_url
  end 
  
  test "should redirect destroy when not logged in" do 
    assert_no_difference 'Post.count' do
      delete post_url(@post), params: {id: @post}
    end
    assert_redirected_to login_url  
  end
end
