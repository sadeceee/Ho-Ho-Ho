class Wishlist < ActiveRecord::Base
  validates :title, presence: true
  has_many :wishlist_items

  def getAllItems
    return wishlist_items
  end
end
