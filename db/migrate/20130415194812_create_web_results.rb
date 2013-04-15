class CreateWebResults < ActiveRecord::Migration
  def change
    create_table :web_results do |t|
      t.boolean :successful
      t.integer :status_code
      t.float :duration

      t.timestamps
    end
  end
end
