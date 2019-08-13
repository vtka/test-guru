class QuestionsController < ApplicationController
  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: :index

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
    @test = Test.find(params[:test_id])
    question = @test.questions.create!(question_params)
    redirect_to "/tests/1/questions/#{question.id}"
  end

  def destroy
    question = @question.destroy!
    redirect_to "/tests/1/questions"
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
    params.require(:question).permit(:body, :id)
  end
end
