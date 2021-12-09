class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    
    # Подтверждает вход пользователя.
    def logged_in_user 
      unless logged_in?
        store_location
        flash[:danger] = "Сначала осуществите вход" 
        redirect_to login_url    
      end   
    end
end
