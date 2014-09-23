class AddPrimaryPhotoToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :primary_photo, :string
    add_column :albums, :secondary_photo, :string
  end
end
