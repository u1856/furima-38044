require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @destination_purchase = FactoryBot.build(:destination_purchase, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入' do
    context '購入できる場合' do
      it '必須項目が入力されていれば購入できる' do
        expect(@destination_purchase).to be_valid
      end
      it '建物名は空でも保存できる' do
        @destination_purchase.building = nil
        expect(@destination_purchase).to be_valid
      end
    end

    context '購入できない場合' do
      it '配送先の情報としてpost_codeが必須' do
        @destination_purchase.post_code = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ("Post code can't be blank")
      end
      it 'post_codeは「3桁ハイフン4桁」の半角文字列のみ保存可能' do
        @destination_purchase.post_code = '1234567'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ("Post code is invalid. Include hyphen(-)")
      end
      it '配送先の情報としてprefecture_idが必須' do
        @destination_purchase.prefecture_id = 0
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ( "Prefecture can't be blank")
      end
      it '配送先の情報としてmunicipalitiesが必須' do
        @destination_purchase.municipalities = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ("Municipalities can't be blank")
      end
      it '配送先の情報としてaddressが必須' do
        @destination_purchase.address = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ("Address can't be blank")
      end
      it '配送先の情報としてphone_numberが必須' do
        @destination_purchase.phone_number = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ( "Phone number can't be blank")
      end
      it 'phone_numberは9桁未満では保存できない' do
        @destination_purchase.phone_number = '09012345'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ( "Phone number Input only number")
      end
      it 'phone_numberは12桁を超えると保存できない' do
        @destination_purchase.phone_number = '090123456789'
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages). to include ( "Phone number Input only number")
      end
      it "tokenが空では登録できない" do
        @destination_purchase.token = nil
        @destination_purchase.valid?
        expect(@destination_purchase.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
