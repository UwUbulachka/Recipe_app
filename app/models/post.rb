class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON 
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 70}
  validates :content, presence: true, length: {maximum: 10000}
  validate :picture_size
  validate :image_size

  private

  def picture_size
    if pictures.size > 5.megabytes
      errors.add(:pictures, "должно быть меньше 5 МБ")
    end
  end

  def image_size
    if image.size > 5.megabytes
      errors.add(:image, "должно быть меньше 5 МБ")
    end
  end  
end
