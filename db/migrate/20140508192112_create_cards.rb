class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :rank
      t.string :suit
      t.attachment :pic
      t.belongs_to :deck
    end
  end
end
