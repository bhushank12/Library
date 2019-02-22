FactoryBot.define do
  factory :library, class: Library do
    name { Faker::Company.name }
    location { Faker::Address.city }
  end
end