
FactoryBot.define do
  factory :user do
    name { Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    firstname { '山田'}
    lastname   { '太郎'}
    firstname_kana { 'ヤマダ'}
    lastname_kana { 'タロウ'}
    birthday { '2000-01-01' }
  end
end


