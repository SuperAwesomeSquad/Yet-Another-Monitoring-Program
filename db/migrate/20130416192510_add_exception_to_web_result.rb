class AddExceptionToWebResult < ActiveRecord::Migration
  def change
    add_column :web_results, :exception, :string
  end
end
