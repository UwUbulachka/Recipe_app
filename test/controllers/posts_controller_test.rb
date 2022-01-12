# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @post = posts(:pie)
  end

  test 'should redirect new when not logged in' do
    assert_no_difference 'Post.count' do
      get new_post_url(@post), params: { id: @post }
    end
    assert_redirected_to login_url
  end

  test 'should redirect create when not logged in' do
    assert_no_difference 'Post.count' do
      post posts_url(@post), params: { post: { title: 'Lorem ipsum', content: 'Lorem ipsum' } }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy when not logged in' do
    assert_no_difference 'Post.count' do
      delete post_url(@post), params: { id: @post }
    end
    assert_redirected_to login_url
  end

  test 'should redirect destroy for wrong post' do
    log_in_as(users(:sasha))
    post = posts(:ice_cream)
    assert_no_difference 'User.count' do
      delete post_url(post), params: { id: post }
    end
    assert_redirected_to root_url
  end
end
