require 'rails_helper'

describe QuestionAccess do
  describe 'associations' do
    let(:question_access) { described_class.new }

    it { expect(question_access).to belong_to(:question) }
  end


  describe 'scopes' do
    describe '.group_by_question' do
      it 'get all question_accesses filtered by question_id' do
        question = FactoryBot.create(:question)

        question_access = FactoryBot.create(:question_access, question: question)
        question_access2 = FactoryBot.create(:question_access, question: question)
        question_access3 = FactoryBot.create(:question_access)

        result = QuestionAccess.group_by_question(question.id)

        expect(result.count).to eq(2)
      end
    end

    describe '.sum_accesses' do
      it 'get sum of times_accessed from all question_accesses created' do
        question_access = FactoryBot.create(:question_access, times_accessed: 20)
        question_access2 = FactoryBot.create(:question_access, times_accessed: 30)
        question_access3 = FactoryBot.create(:question_access, times_accessed: 50)

        result = QuestionAccess.sum_accesses

        expect(result).to eq(100)
      end
    end
  end

  describe '#by_period' do
    before(:all) {
      @start_date = '2020-10-01'
      @end_date = '2020-11-25'

      @question_access = FactoryBot.create(:question_access, date: '2020-11-25 21:01:47')
      @question_access2 = FactoryBot.create(:question_access, date: '2020-11-24 21:01:47')
      @question_access3 = FactoryBot.create(:question_access, date: '2020-10-21 21:01:47')

    }

    it 'return all objects with parameters' do
      result = QuestionAccess.by_period(@start_date, @end_date)

      expect(result.count).to eq(3)
    end

    it 'return all objects without parameters' do
      @start_date = nil
      @end_date = nil

      result = QuestionAccess.by_period(@start_date, @end_date)

      expect(result.count).to eq(3)
    end

    it 'return only one object' do
      @start_date = '2020-11-25'
      @end_date = '2020-11-25'

      result = QuestionAccess.by_period(@start_date, @end_date)

      expect(result.count).to eq(1)
    end

    it 'dont return objects' do
      @start_date = '2020-11-26'
      @end_date = '2020-11-26'

      result = QuestionAccess.by_period(@start_date, @end_date)

      expect(result.count).to eq(0)
    end
  end

  describe '#total_accesses_by_period' do
    before(:all) {
      QuestionAccess.delete_all
      Question.delete_all

      @start_date = '2020-10-01'
      @end_date = '2020-11-25'

      @question = FactoryBot.create(:question, discipline: 'matematica')
      @question2 = FactoryBot.create(:question, discipline: 'matematica')


      @question_access = FactoryBot.create(:question_access, date: '2020-11-25 21:01:47', times_accessed: 20, question: @question)
      @question_access2 = FactoryBot.create(:question_access, date: '2020-11-24 21:01:47', times_accessed: 50, question: @question2)
      @question_access3 = FactoryBot.create(:question_access, date: '2020-10-21 21:01:47', times_accessed: 100, question: @question2)

    }

    it 'return calculation to all questions' do
      result = QuestionAccess.total_accesses_by_period(@start_date, @end_date)

      expect(result.count).to eq(2)
      expect(result.first['question'].id).to eq(@question2.id)
      expect(result.first['sum']).to eq(150)
    end

    it 'return calculation to only one questions' do
      @start_date = '2020-11-25'

      result = QuestionAccess.total_accesses_by_period(@start_date, @end_date)

      expect(result.count).to eq(1)
      expect(result.first['question'].id).to eq(@question.id)
      expect(result.first['sum']).to eq(20)
    end
  end
end
