class CreateFileMonitors < ActiveRecord::Migration
  def change
    create_table :file_monitors do |t|

      t.timestamps
    end
  end
end
