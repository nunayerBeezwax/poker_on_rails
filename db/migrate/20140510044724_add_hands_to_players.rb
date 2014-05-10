class AddHandsToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :hand, :string
  end
end
