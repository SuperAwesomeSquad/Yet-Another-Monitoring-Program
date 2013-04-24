FactoryGirl.define do
  factory :web_result do
    successful true

    factory :unsuccessful_web_result do
      successful false
    end
  end
end
