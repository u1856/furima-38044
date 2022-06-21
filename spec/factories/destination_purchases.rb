FactoryBot.define do
  factory :destination_purchase do
    post_code {"111-1111"}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    municipalities {Faker::Address.city}
    address {Faker::Address.street_address}
    building {"建物"}
    phone_number {"0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}"} 
    token {"tok_abcdefghijk00000000000000000"}
  end
end
