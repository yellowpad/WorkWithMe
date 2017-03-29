class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :account_id
      t.integer :category_id
      t.timestamps
    end
  end
end
