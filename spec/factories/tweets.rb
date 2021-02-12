FactoryBot.define do
  factory :tweet do
    title {"test title"}
    text  {Faker::Lorem.sentence}
    text1 {Faker::Lorem.sentence}
    text2 {Faker::Lorem.sentence}
    text3 {Faker::Lorem.sentence}
    text4 {Faker::Lorem.sentence}
    association :user 

    after(:build) do |tweet|
      tweet.images.attach(io: File.open('public/images/test-image1.png'),filename: 'test-image1.png')
    end
  end
end