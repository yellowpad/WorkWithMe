class RenameColumnForComments < ActiveRecord::Migration[5.0]
  def change
  	rename_column :comments, :parent_comment_id, :parent_id
  end
end
