class AddDescriptionToBaseMonitors < ActiveRecord::Migration
  def change
    add_column :base_monitors, :description, :string
  end
end
