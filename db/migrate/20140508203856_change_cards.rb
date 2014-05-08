class ChangeCards < ActiveRecord::Migration
  def change
    remove_column :cards, :pic_file_name
    remove_column :cards, :pic_file_size
    remove_column :cards, :pic_content_type
    remove_column :cards, :pic_updated_at
    add_column :cards, :pic, :string
  end
end
