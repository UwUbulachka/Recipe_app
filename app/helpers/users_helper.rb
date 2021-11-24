module UsersHelper

def avatar_for(user)
  if user.avatar.file.nil? 
     user = image_tag("logo.png", {size: 50} )
  else 
     user.avatar  
  end
end

end
