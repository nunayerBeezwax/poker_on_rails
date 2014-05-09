class CreateTable < ActiveRecord::Migration
  def change
    create_table :tables do |t|
    	t.integer :pot, default: 0
    	t.integer :button
    	t.integer :bb
    	t.integer :sb
    	t.integer :bet
    	t.integer :action
    end
  end
end
