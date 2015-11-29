class WishlistItemsController < ApplicationController
  # GET /wishlists
  def index
    @wishlist_item = WishlistItems.all
  end

  # GET /wishlists/1
  def show
    @wishlist_item = WishlistItems.find(params[:id])
  end

  def edit
  end

  # GET /wishlists/new
  def new
    @wishlist_item = WishlistItem.new
  end

  # POST /wishlists
  def create
    wishlist_param = { wishlist_id: params.require(:wishlist_id) }
    @wishlist_item = WishlistItem.new(wishlist_item_params.merge(wishlist_param))
    @wishlist_item.priority = set_priority

    if @wishlist_item.save
      redirect_to wishlists_url, notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # DELETE /wishlists/1
  def destroy
    WishlistItem.find_by(wishlist_id: params[:wishlist_id], id: params[:id]).destroy
    update_priorities
    redirect_to wishlists_url, notice: 'Wishlist Item was successfully destroyed.'
  end
private
  def wishlist_item_params
    params.require(:wishlist_item).permit(:title, :price)
  end

  def set_priority
    Wishlist.find(params[:wishlist_id]).wishlist_items.count + 1
  end

  def update_priorities
    Wishlist.find(params[:wishlist_id]).wishlist_items.order(:priority).each_with_index do |item, index|
      item.update(priority: index + 1)
    end
  end
end
