class AddMoreImagesToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :image2, :string
    add_column :posts, :image3, :string
  end
end
