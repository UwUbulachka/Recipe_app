# frozen_string_literal: true

class AddPicturesToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :pictures, :string
  end
end
