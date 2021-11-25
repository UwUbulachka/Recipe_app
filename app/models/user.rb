class User < ApplicationRecord
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



