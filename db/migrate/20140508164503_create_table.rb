class CreateTable < ActiveRecord::Migration
  def change
    create_table :tables do |t|
    	t.integer :pot, default: 0
    	t.integer :button
    end
  end
end
