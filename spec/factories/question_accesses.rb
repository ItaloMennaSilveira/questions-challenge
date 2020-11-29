FactoryBot.define do
  factory :question_access do
    date { '2020-11-25 21:01:47' }
    times_accessed { Faker::Number.between(from: 1, to: 100) }
    question { create(:question) }
  end
end
