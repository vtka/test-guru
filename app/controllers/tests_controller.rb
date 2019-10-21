class TestsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :set_test, only: %i[show edit update destroy start]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to test_path
    else
      render :edit
    end
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @test.destroy!
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def rescue_with_test_not_found
    render plain: 'Test was not found'
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :author_id, :category_id)
  end
end
