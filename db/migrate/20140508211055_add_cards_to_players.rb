class AddCardsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :card_id, :integer
    add_column :cards, :player_id, :integer
  end
end
