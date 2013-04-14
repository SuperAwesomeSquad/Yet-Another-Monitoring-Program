class CreatePings < ActiveRecord::Migration
  def change
    create_table :pings do |t|
      t.string :hostname
      t.integer :frequency_in_seconds
      t.integer :user_id
 
      t.timestamps
    end
  end
end
