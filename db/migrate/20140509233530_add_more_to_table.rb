class AddMoreToTable < ActiveRecord::Migration
  def change
  	add_column :tables, :action, :integer
  	add_column :tables, :bet, :integer
  end
end
