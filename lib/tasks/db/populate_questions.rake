namespace :db do
  desc 'Populates table questions.'
  task populate_questions: :environment do
    data = ActiveSupport::JSON.decode(File.read('lib/tasks/db/data/questions.json'))

    ActiveRecord::Base.transaction do
      Question.import!(data, on_duplicate_key_ignore: true)
    end
  end
end
