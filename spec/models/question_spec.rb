require 'rails_helper'

describe Question do
  describe 'associations' do
    let(:question) { described_class.new }

    it { expect(question).to have_many(:question_accesses) }
  end

  describe '#daily_access_by_discipline' do
    it 'test values returned and order of hash' do
      QuestionAccess.delete_all
      Question.delete_all

      question = FactoryBot.create(:question, discipline: 'matematica', daily_access: 10)
      question2 = FactoryBot.create(:question, discipline: 'matematica', daily_access: 10)
      question3 = FactoryBot.create(:question, discipline: 'portugues', daily_access: 5)

      result = Question.daily_access_by_discipline

      expect(result['matematica']).to eq(20)
      expect(result.first[0]).to eq("matematica")
    end
  end
end