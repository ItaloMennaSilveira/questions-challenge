namespace :db do
  desc 'Populates table question_access.'
  task populate_question_access: :environment do
    data = ActiveSupport::JSON.decode(File.read('lib/tasks/db/data/question_access.json'))

    ActiveRecord::Base.transaction do
      QuestionAccess.import!(data)
    end
  end
end
