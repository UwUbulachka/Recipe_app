class AddPreparationTimeToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :preparation_time, :time
  end
end
