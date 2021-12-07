class Post < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 70}
  validates :content, presence: true, length: {maximum: 10000}
end
