FactoryBot.define do
  factory :question do
    statement { 'MyText' }
    text { 'MyText' }
    answer { 'MyString' }
    daily_access { 1 }
    discipline { 'MyString' }
  end
end
