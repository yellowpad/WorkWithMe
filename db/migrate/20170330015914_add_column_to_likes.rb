class AddColumnToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :heart, :integer, default: 0
  end
end
