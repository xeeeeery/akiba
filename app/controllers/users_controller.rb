class UsersController < ApplicationController

  def dashboard
    @user = current_user
    @user_items = Item.where(user_id: current_user.id)
  end
end
