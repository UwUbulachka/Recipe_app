# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :post
  validates :ing, presence: true
end
