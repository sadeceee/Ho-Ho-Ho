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

    if @wishlist_item.save
      redirect_to wishlist_path id: params[:wishlist_id], notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  # DELETE /wishlists/1
  def destroy
    WishlistItem.find_by(wishlist_id: params[:wishlist_id], id: params[:id]).destroy
    redirect_to wishlist_path id: params[:wishlist_id], notice: 'Wishlist Item was successfully destroyed.'
  end
private
  def wishlist_item_params
    params.require(:wishlist_item).permit(:title, :price)
  end
end
