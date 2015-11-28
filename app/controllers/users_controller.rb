class UsersController < ApplicationController

  def user_wishlists
    @user_wishlists = current_user.wishlists
  end
end