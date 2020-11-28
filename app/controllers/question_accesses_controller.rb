class QuestionAccessesController < ApplicationController
  before_action :set_question_access, only: [:show, :edit, :update, :destroy]

  def index
    if params[:start_date] || params[:end_date]
      @question_accesses = Kaminari.paginate_array(
        QuestionAccess.total_accesses_by_period(
          params[:start_date].to_date.strftime("%F"),
          params[:end_date].to_date.strftime("%F")
        )
      ).page(params[:page]).per(10)

      respond_to do |format|
        format.html
        format.js do
          render  file: "question_accesses/question_accesses.js.erb",
                  layout: false
        end
      end
    else
      @question_accesses = Kaminari.paginate_array(
        QuestionAccess.total_accesses_by_period(nil, nil)
      ).page(params[:page]).per(10)
    end
  end
end
