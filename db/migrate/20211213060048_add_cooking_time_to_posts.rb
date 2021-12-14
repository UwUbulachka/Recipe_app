class AddCookingTimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :cooking_time, :time
  end
end
