# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @posts = Post.includes(:user)
  end

  def my_feed
    @feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
  end

  def about; end

  def contact; end
end
