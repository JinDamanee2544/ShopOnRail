class ShopController < ApplicationController
  def index
    @shopItems = Item.where(user_id: params[:id])
    @ownerName = User.find(params[:id]).name
  end

  def buy
    # create inventory
    puts "buying item"
    puts session[:user_id]
    puts params[:product_id]

    Inventory.create(
      user_id: session[:user_id],
      item_id: params[:id],
      price: Item.find(params[:id]).price,
      buy_date: Time.now
    )
    updateItem = Item.find(params[:id])
    updateItem.update(stock: updateItem.stock - 1)
    puts "-----------Item bought--------------"

    ownerId = Item.find(params[:id]).user_id

    redirect_to shop_index_path(ownerId)
  end
end
