class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON 
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 70}
  validates :content, presence: true, length: {maximum: 10000}
  validate :picture_size

  private

  # Проверяет размер выгруженного изображения.
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "должно быть меньше 5 МБ")
    end
  end
end
