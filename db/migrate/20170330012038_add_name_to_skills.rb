class AddNameToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :name, :string
  end
end
