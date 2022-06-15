require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品できる場合' do
      it '必須項目が入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it "imageが空では出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空では出品できない" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "textが空では出品できない" do
        @item.text = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it "category_idが1以外でないと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "situation_idが1以外でないと出品できない" do
        @item.situation_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end
      it "delivery_charge_idが1以外でないと出品できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it "prefecture_idが1以外でないと出品できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "shipping_date_idが1以外でないと出品できない" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "priceが空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが300未満では出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9999999以上では出品できない" do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが全角数字では出品できない" do
        @item.price = "１００００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number")
      end
      it "priceが半角英字では出品できない" do
        @item.price = "sample"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number")
      end
      it "priceが半角英数字混合では出品できない" do
        @item.price = "sample1000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range", "Price Half-width number")
      end
      it "userが紐付いていないと出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end 
end
