FactoryGirl.define do
  factory :user do
    email
    password 'password'

    factory :admin do
      admin true
    end
  end
end
