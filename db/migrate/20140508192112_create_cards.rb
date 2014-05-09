class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :rank
      t.string :suit
      t.string :pic
      t.belongs_to :deck
      t.boolean :played
    end
  end
end
