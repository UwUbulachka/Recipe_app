module UsersHelper
  def avatar_for(user, size = '' )
      @avatar = user.avatar
      if @avatar.file.nil?
          @avatar_user = image_tag("logo.png", size: size, class: "avatar")
      else
          @avatar_user = image_tag(@avatar.url, size: size, class: "avatar")
      end
  end
end

