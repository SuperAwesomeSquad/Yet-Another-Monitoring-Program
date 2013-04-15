class CreateWebMonitors < ActiveRecord::Migration
  def change
    create_table :web_monitors do |t|
      t.string :url

      t.timestamps
    end
  end
end
