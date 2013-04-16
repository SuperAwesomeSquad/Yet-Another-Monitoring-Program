FactoryGirl.define do
  factory :ping_result do
    successful true
    duration 1.5

    factory :unsuccessful_ping_result do
      successful false
      duration 'null'
    end
  end
end
