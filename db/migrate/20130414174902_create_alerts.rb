class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.boolean :active
      t.integer :user_id
      t.integer :ping_id

      t.timestamps
    end
  end
end
