FactoryGirl.define do
  factory :message do
    body     "Hello"
    image    "123.jpg"
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end
end
