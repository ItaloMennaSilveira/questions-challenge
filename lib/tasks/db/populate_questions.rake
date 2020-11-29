namespace :db do
  desc 'Populates table questions.'
  task populate_questions: :environment do
    data = ActiveSupport::JSON.decode(File.read('lib/tasks/db/data/questions.json'))

    p "initializing populate question_accesses..."
    ActiveRecord::Base.transaction do
      Question.import!(data, on_duplicate_key_ignore: true)
    end
    p "finalizing populate question_accesses..."
  end
end
