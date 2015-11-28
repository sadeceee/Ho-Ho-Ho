class Wishlist < ActiveRecord::Base
  validates :title, presence: true
  has_many :wishlist_items

  def get_wishlist_sum
    wishlist_items.reduce(0) { |sum,witem| sum + witem.price}
  end

end
