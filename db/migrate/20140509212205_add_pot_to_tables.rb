class AddPotToTables < ActiveRecord::Migration
  def change
  	add_column :tables, :pot, :integer
  end
end
