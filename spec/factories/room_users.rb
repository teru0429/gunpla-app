FactoryBot.define do
  factory :room_user do
    name {Faker::Team.name}
    association :user
    association :room
  end
end