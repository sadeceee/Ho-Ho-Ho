class WishlistItem < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :wishlist
end
