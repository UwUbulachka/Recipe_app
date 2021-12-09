class PagesController < ApplicationController
  def home
  end

  def my_feed
   @feed_items = current_user.feed.paginate(page: params[:page], per_page: 15) if logged_in?
  end  

  def about
  end

  def contact
  end
end
