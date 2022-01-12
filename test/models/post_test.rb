# frozen_string_literal: true

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:sasha)
    meat = Category.create(name: 'meat')
    time = Time.now
    @post = @user.posts.build(title: 'lorem ipsum',
                              content: 'Lorem ipsum',
                              category: meat, image: File.open(Rails.root.join('app', 'assets', 'images', 'pizza.jpg')),
                              cooking_time: time, preparation_time: time)
  end

  test 'should be valid' do
    assert @post.valid?
  end

  test 'user id should be present' do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test 'title should be present' do
    @post.title = ' '
    assert_not @post.valid?
  end

  test 'content should be present' do
    @post.content = ' '
    assert_not @post.valid?
  end

  test 'title should be at most 70 characters' do
    @post.title = 'a' * 71
    assert_not @post.valid?
  end

  test 'content should be at most 10000 characters' do
    @post.content = 'a' * 10_001
    assert_not @post.valid?
  end

  test 'order should be most recent first' do
    assert_equal Post.first, posts(:omelet)
  end
end
