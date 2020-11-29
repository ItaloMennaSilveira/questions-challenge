require 'rails_helper'

RSpec.describe 'questions/index', type: :view do
  before(:each) do
    assign(:questions, [
             Question.create!,
             Question.create!
           ])
  end
end
