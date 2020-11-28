require 'rails_helper'

RSpec.describe QuestionAccessesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/question_accesses').to route_to('question_accesses#index')
    end

    it 'routes to #new' do
      expect(get: '/question_accesses/new').to route_to('question_accesses#new')
    end

    it 'routes to #show' do
      expect(get: '/question_accesses/1').to route_to('question_accesses#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/question_accesses/1/edit').to route_to('question_accesses#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/question_accesses').to route_to('question_accesses#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/question_accesses/1').to route_to('question_accesses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/question_accesses/1').to route_to('question_accesses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/question_accesses/1').to route_to('question_accesses#destroy', id: '1')
    end
  end
end
