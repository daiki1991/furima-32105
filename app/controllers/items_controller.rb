class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end
    
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.purchase != nil
      redirect_to root_path
    elsif current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
       redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id 
      @item.destroy
      redirect_to root_path
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :text, :price, :item_condition_id, :shipping_fee_id,
    :prefecture_id, :days_to_ship_id, :category_id).merge(user_id: current_user.id)

  end

  def set_item
    @item = Item.find(params[:id])
  end
end
