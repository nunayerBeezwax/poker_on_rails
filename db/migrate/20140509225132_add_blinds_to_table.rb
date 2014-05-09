class AddBlindsToTable < ActiveRecord::Migration
  def change
  	add_column :tables, :bb, :integer
  	add_column :tables, :sb, :integer
  end
end
