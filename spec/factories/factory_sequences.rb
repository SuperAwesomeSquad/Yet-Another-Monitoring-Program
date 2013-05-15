FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end
  sequence :url do |n|
    "http://www#{n}.example.com"
  end
  sequence :hostname do |n|
    "www#{n}.example.com"
  end
end
