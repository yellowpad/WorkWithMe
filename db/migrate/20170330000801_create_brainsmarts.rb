class CreateBrainsmarts < ActiveRecord::Migration[5.0]
  def change
    create_table :brainsmarts do |t|
      t.integer :skill_id
      t.integer :account_id
      t.timestamps
    end
  end
end
