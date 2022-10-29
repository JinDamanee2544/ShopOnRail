class MainController < ApplicationController
  before_action :must_be_log_in , only: %i[ user_item inventory ]

  def login
  end

  def create
    u = User.where(username: params[:username]).first
    if(u && u.authenticate(params[:password]))
      session[:logged_in] = true
      session[:user_id] = u.id
      redirect_to main_user_item_path
    else
      redirect_to main_login_path, notice: "Incorrect username or password"
    end
  end

  def destroy
    reset_session
  end

  def user_item
    @allItem = Item.where(user_id: session[:user_id])
  end

  def inventory
    @inventoryItem = Inventory.where(user_id: session[:user_id])
  end
end
