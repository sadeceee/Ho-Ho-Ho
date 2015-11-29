class AddPriorityToWishlistItem < ActiveRecord::Migration
  def change
    add_column :wishlist_items, :priority, :integer
  end
end
