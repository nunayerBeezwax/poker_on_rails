class AddButtonToTable < ActiveRecord::Migration
  def change
  	add_column :tables, :button, :integer
  end
end
