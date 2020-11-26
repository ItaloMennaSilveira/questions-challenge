namespace :db do
  desc 'Populates all data on database'
  task 'populate': [
    'db:populate_questions',
    'db:populate_question_access'
  ]
end
