require 'rails_helper'

RSpec.describe DestinationPurchase, type: :model do
  before do
    @destination_purchase = FactoryBot.build(:destination_purchase)
  end

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
  it 'phone_numberは10桁以上11桁以内の半角数値のみ保存可能' do
    @destination_purchase.phone_number = '090-1234-5678'
    @destination_purchase.valid?
    expect(@destination_purchase.errors.full_messages). to include ( "Phone number Input only number")
  end
  it "tokenが空では登録できない" do
    @destination_purchase.token = nil
    @destination_purchase.valid?
    expect(@destination_purchase.errors.full_messages).to include("Token can't be blank")
  end
end
