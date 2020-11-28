class QuestionAccess < ApplicationRecord
  belongs_to :question

  scope :group_by_question, -> (question_id) { where(question_id: question_id) }
  scope :sum_accesses, -> { sum(&:times_accessed) }

  def self.by_period(start_date, end_date)
    start_date = start_date.to_datetime.beginning_of_day if start_date
    end_date = end_date.to_datetime.end_of_day if end_date

    return where('date BETWEEN ? AND ?', start_date, end_date) if start_date && end_date

    return where('? <= date', start_date) if start_date

    return where('? >= date', end_date) if end_date

    all
  end

  def self.total_accesses_by_period(start_date, end_date)
    question_with_sum = []
    obj = {}
    question_accesses_by_period = by_period(start_date, end_date)

    question_accesses_by_period.includes(:question).collect(&:question).uniq.each do |question|
      obj = {}
      obj['question'] = question
      obj['sum'] = question_accesses_by_period.group_by_question(question.id).sum_accesses
      question_with_sum << obj
    end

    question_with_sum.sort_by{ |o| o['sum'] }.reverse
  end
end