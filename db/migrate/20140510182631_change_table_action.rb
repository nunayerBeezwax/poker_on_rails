class ChangeTableAction < ActiveRecord::Migration
  def change
		rename_column :tables, :action, :action_on_seat
  end
end
