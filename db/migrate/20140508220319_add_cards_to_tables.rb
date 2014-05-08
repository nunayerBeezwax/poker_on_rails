class AddCardsToTables < ActiveRecord::Migration
  def change
    add_column :tables, :card_id, :integer
    add_column :cards, :table_id, :integer
  end
end
