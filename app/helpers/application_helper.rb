module ApplicationHelper
  require 'dotiw'

  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::NumberHelper

  def full_title(page_title = '')
    base_title = "Вкусные рецепты"
    if page_title.empty?
  	  base_title
    else 
      "#{page_title} | #{base_title}"		
    end
  end

  def avatar_for(user, size = '' )
      @avatar = user.avatar
      if @avatar.file.nil?
          @avatar_user = image_tag("logo.png", size: size, class: "avatar")
      else
          @avatar_user = image_tag(@avatar.url, size: size, class: "avatar")
      end
      return @avatar_user
  end  

  def cooking
    @post.preparation_time + @post.preparation_time.try(:strftime, ("%k")).to_i.hour + @post.preparation_time.try(:strftime, ("%M")).to_i.minute  
  end  
 

  def cooking1
    @post.cooking_time + @post.cooking_time.try(:strftime, ("%k")).to_i.hour + @post.cooking_time.try(:strftime, ("%M")).to_i.minute  
  end  

  def cook
    @post.try(:preparation_time).try(:strftime, ("%k")).to_i.hour + @post.preparation_time.try(:strftime, ("%M")).to_i.minute  
  end 


end
