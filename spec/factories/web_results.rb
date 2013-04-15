# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :web_result do
    successful true
    status_code 200
    duration 1.5
  end
end
