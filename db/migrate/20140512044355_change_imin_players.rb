class ChangeIminPlayers < ActiveRecord::Migration
  def change
  	remove_column :players, :imin
  	add_column :players, :imin, :integer, default: 0
  end
end
