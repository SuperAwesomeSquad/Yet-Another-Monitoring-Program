class CreatePingResults < ActiveRecord::Migration
  def change
    create_table :ping_results do |t|
      t.float :duration
      t.string :exception
      t.integer :ping_id
      t.boolean :successful

      t.timestamps
    end
    add_index :ping_results, :ping_id
  end
end
