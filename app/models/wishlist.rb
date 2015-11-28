class Wishlist < ActiveRecord::Base
  validates :title, presence: true
end
