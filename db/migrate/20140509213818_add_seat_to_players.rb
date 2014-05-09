class AddSeatToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :seat, :integer
  end
end
