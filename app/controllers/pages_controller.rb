class PagesController < ApplicationController
  def home
     @posts = Post.includes(:user)
  end

  def my_feed
   @feed_items = current_user.feed.paginate(page: params[:page])
  end  

  def about
  end

  def contact
  end
end
