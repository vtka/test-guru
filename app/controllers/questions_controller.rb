class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions.all
  end

  def show
    render inline: '<%= @question.body %>'
  end

  def new

  end

  def create
    @question = @test.questions.create!(question_params)
    redirect_to test_questions_path(@test)
  end

  def destroy
    @test = @question.test
    @question.destroy!
    redirect_to test_questions_path(@test)
  end

  private

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
