class WishlistItemsController < ApplicationController
  # GET /wishlists
  def index
    @wishlist_item = WishlistItem.all
  end

  # GET /wishlists/1
  def show
    @wishlist_item = WishlistItem.find(params[:id])
  end

  def edit
    @wishlist_item = WishlistItem.find(params[:id])
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
      redirect_to wishlist_path id: params[:wishlist_id], notice: 'Item was successfully created.'
    else
      render :new
    end
  end

  def update
    @wishlist_item = WishlistItem.find(params[:id])
    if @wishlist_item.update_attributes wishlist_item_params
      redirect_to wishlist_path id: params[:wishlist_id], notice: 'Wishlist Item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wishlists/1
  def destroy
    wishlist_item = WishlistItem.find(params[:id])
    if wishlist_item
      wishlist_item.destroy
      update_priorities
    end
    redirect_to wishlist_path id: params[:wishlist_id], notice: 'Wishlist Item was successfully destroyed.'
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
