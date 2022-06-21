class DestinationsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @item = Item.find(params[:item_id])
    @destination_purchase = DestinationPurchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @destination_purchase = DestinationPurchase.new(destination_params)
    if @destination_purchase.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: destination_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
      @destination_purchase.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def destination_params
    params.require(:destination_purchase).permit(:post_code, :prefecture_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

end
