class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :table
      t.string :name
      t.integer :chips
      t.integer :seat
      t.string :hand
      t.integer :imin, default: 0
    end
  end
end
