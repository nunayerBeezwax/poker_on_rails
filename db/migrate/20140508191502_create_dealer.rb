class CreateDealer < ActiveRecord::Migration
  def change
    create_table :dealers do |t|
      t.belongs_to :table

    end
  end
end
