class RemoveAssetFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :asset, :string
  end
end
