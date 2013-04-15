FactoryGirl.define do
  factory :user do
    email 'user@example.com'
    password 'password'
  end
  factory :admin, class: User do
    email 'user@example.com'
    admin true
    password 'password'
  end
end
