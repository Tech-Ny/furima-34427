require 'faker'

Faker::Config.locale = 'ja'

FactoryBot.define do
  factory :user do
      nickname {'yey'}
      email {'furima@tech.com'}
      password {'ouchi3434'}
      password_confirmation {password}
      lastname{'田中'}
      firstname{'太朗'}
      lastnamedetail{'タナカ'}
      firstnamedetail{'タロウ'}
      birthday{'1996-06-08'}
  end
end
