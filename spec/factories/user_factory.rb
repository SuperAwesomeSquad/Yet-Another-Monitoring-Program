FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@yamp.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end
end
