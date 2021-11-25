module UsersHelper
  def avatar_for(user)
      @avatar = user.avatar
      if @avatar.file.nil?
          @avatar_user = image_tag("logo.png", size: 80, class: "avatar")
      else
          @avatar_user = image_tag(@avatar.url, size: 80, class: "avatar")
      end
  end
end

