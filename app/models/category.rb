# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :posts
  validates :name, presence: true, length: { maximum: 20 }
end
