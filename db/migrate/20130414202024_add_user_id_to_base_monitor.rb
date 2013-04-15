class AddUserIdToBaseMonitor < ActiveRecord::Migration
  def change
  	add_column	:base_monitors, :user_id, :integer 
  end
end
