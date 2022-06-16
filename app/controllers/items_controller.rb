class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit]
  before_action :find_item, only: [:show, :edit, :update]
  
  def index
    @items = Item.order(created_at: :desc)
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
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:content, :image, :name, :text, :price, :category_id, :situation_id, :delivery_charge_id, :prefecture_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

end
