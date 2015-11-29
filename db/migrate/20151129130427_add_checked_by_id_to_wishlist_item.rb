class AddCheckedByIdToWishlistItem < ActiveRecord::Migration
  def change
    add_column :wishlist_items, :checked_by_id, :integer
  end
end
