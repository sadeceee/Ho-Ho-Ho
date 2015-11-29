class WishlistItem < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true, numericality: true, inclusion: { in: 0..1000000, message: "Ungültiger Preis" }
  belongs_to :wishlist
end
