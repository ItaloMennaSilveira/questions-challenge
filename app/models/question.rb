class Question < ApplicationRecord
  has_many :question_accesses

  def self.daily_access_by_discipline
    hash = {}
    questions_by_discipline = all.group_by(&:discipline)

    questions_by_discipline.each do |discipline, questions|
      hash[discipline] = questions.sum(&:daily_access)
    end

    hash.sort_by { |_discipline, daily_access| daily_access }.reverse.to_h
  end
end
