class QuestionsController < ApplicationController
  def index
    @questions = Kaminari.paginate_array(
      Question.daily_access_by_discipline.to_a
    )
                         .page(params[:page]).per(10)
  end
end
