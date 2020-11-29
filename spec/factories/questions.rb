FactoryBot.define do
  factory :question do
    statement { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    answer { 'A' }
    daily_access { Faker::Number.between(from: 1, to: 100) }
    discipline { "matematica" }
  end
end
