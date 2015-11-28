class Wishlist < ActiveRecord::Base
  validates :title, presence: true
  has_many :wishlist_items
end
