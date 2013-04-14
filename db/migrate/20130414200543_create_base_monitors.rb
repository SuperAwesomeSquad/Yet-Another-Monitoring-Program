class CreateBaseMonitors < ActiveRecord::Migration
  def change
    create_table :base_monitors do |t|
      t.string	:name
      t.references :monitorable, polymorphic: true

      t.timestamps
    end
  end
end
