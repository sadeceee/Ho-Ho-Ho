class WishlistItem < ActiveRecord::Base
  validates :title, presence: true
end
