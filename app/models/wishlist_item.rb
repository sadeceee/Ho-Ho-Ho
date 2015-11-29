class WishlistItem < ActiveRecord::Base
  validates :title, presence: true
  validates :price, presence: true, numericality: true, inclusion: { in: 0..1000000, message: "Ungültiger Preis" }
  validates :priority, presence: true, numericality: true, inclusion: { in: 1..1000 }
  belongs_to :wishlist
  default_scope { order(:priority) }
end
