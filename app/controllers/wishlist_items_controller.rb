class WishlistItemsController < ApplicationController
  # GET /wishlists
  def index
    @wishlist_item = WishlistItems.all
  end

  # GET /wishlists/1
  def show
      @wishlist_item = WishlistItems.find(params[:id])
  end

  # GET /wishlists/new
  def new
    @wishlist_item = WishlistItem.new
  end

  # POST /wishlists
  def create
    @wishlist_item = WishlistItem.new(wishlist_item_params)

    if @wishlist_item.save
      redirect_to wishlists_url, notice: 'Item was successfully created.'
    else
      render :new
    end
  end



  # DELETE /wishlists/1
  def destroy
    @wishlist_item.destroy
    redirect_to wishlists_url, notice: 'Wishlist Item was successfully destroyed.'
  end
private
  def wishlist_item_params
    params.require(:wishlist_item).permit(:title, :price, :wishlist_id)
  end
end
