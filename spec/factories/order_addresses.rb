FactoryBot.define do
  factory :order_address do
    post_num{'135-7722'}
    region_id{3}
    cwtv{'裏表山道'}
    addresses{'中弛1-5-3'}
    building{'鳳凰ビルディング3階'}
    phone_num{'09055334422'}
    token {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end
