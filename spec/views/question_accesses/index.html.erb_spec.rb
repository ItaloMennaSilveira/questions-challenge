require 'rails_helper'

RSpec.describe 'question_accesses/index', type: :view do
  before(:each) do
    assign(:question_accesses, [
             QuestionAccess.create!,
             QuestionAccess.create!
           ])
  end
end
