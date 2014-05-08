class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.belongs_to :table
      t.string :name
      t.integer :chips
    end
  end
end
