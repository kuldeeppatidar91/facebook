class RemoveColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :like
  end
end
