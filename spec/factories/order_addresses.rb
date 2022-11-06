FactoryBot.define do
  factory :order_address do
    postal {'123-4567'}
    area_id {1}
    city {'東京都'}
    block {'1-1'}
    building {'マンション'}
    phonenumber {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
