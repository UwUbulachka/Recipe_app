class User < ApplicationRecord
  
  attr_accessor :remember_token
  before_save :downcase_email
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true, length: {maximum: 50} 
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
								    format: {with: VALID_EMAIL}, 
								    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  validate :avatar_size

  # Возвращает дайджест для указанной строки.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ?
    BCrypt::Engine::MIN_COST :
    BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Новый токен
  def User.new_token
    SecureRandom.urlsafe_base64
  end  

  # Хеширование нового токена и сохрание в бд
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end  

  def authenticated?(remember_token) 
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token) 
  end  

  def forget
    update_attribute(:remember_digest, nil)
  end

private  

  def downcase_email
  	self.email = email.downcase 
  end

  # Проверяет размер выгруженного изображения.
  def avatar_size
    if avatar.size > 5.megabytes
      errors.add(:avatar, "должно быть меньше 5 МБ") 
    end
  end
end



