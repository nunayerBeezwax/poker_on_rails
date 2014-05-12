class AddIminToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :imin, :boolean, {default: false}
  end
end
