# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients
  belongs_to :user
  belongs_to :category
  default_scope -> { order(created_at: :desc) }
  mount_uploaders :pictures, PictureUploader
  serialize :pictures, JSON
  mount_uploader :image, ImageUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 70 }
  validates :content, presence: true, length: { maximum: 10_000 }
  validates :image, presence: true, if: ->(record) { record.image_integrity_error.blank? }
  validates :cooking_time, presence: true
  validates :preparation_time, presence: true
  validate  :picture_size
  validate  :image_size

  def self.search(search)
    if search != ''
      Post.where('title LIKE(?)', "%#{search.capitalize}%")
    else
      Post.all
    end
  end

  private

  def picture_size
    errors.add(:pictures, 'должно быть меньше 5 МБ') if pictures.size > 5.megabytes
  end

  def image_size
    errors.add(:image, 'должно быть меньше 5 МБ') if image.size > 5.megabytes
  end
end
