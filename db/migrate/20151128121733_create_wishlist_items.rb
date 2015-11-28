class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.string :Title
      t.float :price

      t.timestamps null: false
    end
  end
end
