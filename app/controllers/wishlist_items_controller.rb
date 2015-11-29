class WishlistItemsController < ApplicationController

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

  def toggle_check
    @wishlist_item = WishlistItem.find(params[:id])
    if @wishlist_item.checked_by_id.present? && current_user.id == @wishlist_item.checked_by_id
      @wishlist_item.update_attributes(checked_by_id: nil)
    elsif @wishlist_item.checked_by_id.present? && current_user.id != @wishlist_item.checked_by_id
      redirect_to wishlist_path id: params[:wishlist_id], notice: 'Wishlist Item was checked by someone else.'
      return
    else
      @wishlist_item.update_attributes(checked_by_id: params[:checked_by_id])
    end
    redirect_to wishlist_path id: params[:wishlist_id], notice: 'Wishlist Item was successfully checked.'
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
