class TestsController < ApplicationController
  before_action :find_test, only: :show

  def index
    # @questions = Question.all
    render plain: 'All tests'
  end

  def show
    render inline: '<%= @test.title %>'
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
