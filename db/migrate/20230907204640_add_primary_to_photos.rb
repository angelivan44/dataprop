class AddPrimaryToPhotos < ActiveRecord::Migration[7.0]
  def change
    add_column :photos, :primary, :boolean , default: false
  end
end
