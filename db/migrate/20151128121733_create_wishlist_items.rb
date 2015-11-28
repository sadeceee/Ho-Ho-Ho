class CreateWishlistItems < ActiveRecord::Migration
  def change
    create_table :wishlist_items do |t|
      t.string :title
      t.float :price
      t.integer :wishlist_id

      t.timestamps null: false
    end
  end
end
