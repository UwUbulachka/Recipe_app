# frozen_string_literal: true

require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:sasha)
  end

  test 'post interface new post' do
    log_in_as(@user)
    get new_post_path
    # Недопустимая информация в форме.
    assert_no_difference 'Post.count' do
      post posts_path(@user), params: { post: { title: '', content: '' } }
    end
    assert_select 'div#error_explanation'
    # Допустимая информация в форме.
    # title = "Lorem ipsum"
    # content = "Lorem ipsum"
    # image = File.open(Rails.root.join('app', 'assets', 'images', 'pizza.jpg'))
    # meat = Category.create(name: 'meat')
    # assert_difference 'Post.count', 1 do
    #   post new_post_path(@user), params: { post: { title: title, content: content, category: meat, image: image } }
    # end
    # assert_redirected_to user_path(@user)
    # follow_redirect!
    # assert_match title, response.body
    # assert_match content, response.body
  end

  test 'post interface show user' do
    log_in_as(@user)
    get my_feed_path
    # Удаление сообщения
    assert_select 'a', text: 'удалить'
    first_post = @user.posts.paginate(page: 1, per_page: 15).first
    assert_difference 'Post.count', -1 do
      delete post_path(first_post)
    end
    # Переход в профиль другого пользователя.
    get user_path(users(:masha))
    assert_select 'a', text: 'удалить', count: 0
  end
end
