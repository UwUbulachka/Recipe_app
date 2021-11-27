ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  
  parallelize(workers: :number_of_processors)

  fixtures :all
   
    # Возвращает true, если тестовый пользователь вошел.
  def is_logged_in?
    !session[:user_id].nil?
  end 

  # Выполняет вход тестового пользователя.
  def log_in_as(user, options = {})
    password = options[:password] || 'password' 
    remember_me = options[:remember_me] || '1'
      post login_path, params: {session: { email: user.email, 
                                              password: password,
                                              remember_me: remember_me }}
    
  end

end
