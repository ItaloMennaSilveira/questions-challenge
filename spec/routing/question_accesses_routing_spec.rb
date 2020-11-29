require 'rails_helper'

RSpec.describe QuestionAccessesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/question_accesses').to route_to('question_accesses#index')
    end
  end
end
