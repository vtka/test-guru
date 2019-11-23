class Admin::BadgesController < ApplicationController
  # Test Controller
  # before_action :set_tests, only: %i[index update_inline]
  before_action :set_badge, only: %i[show edit update destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_badge_not_found

  def index
    @badges = Badge.all
  end

  def show; end

  def edit; end

  def update
    if @badge.update(badge_params)
      redirect_to admin_badge_path, notice: t('.edited')
    else
      render :edit
    end
  end

  # def update_inline
  #   if @test.update(test_params)
  #     redirect_to admin_tests_path
  #   else
  #     render :index
  #   end
  # end

  def new
    @badge = Badge.new
  end

  def create
    # @badge = current_user.created_tests.new(test_params)
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badge_path(@badge), notice: t('.success')
    else
      render :new
    end
  end

  def destroy
    @badge.destroy!
    redirect_to admin_badges_path,  alert: t('.deleted')
  end

  private

  # def set_tests
  #   @tests = Test.all
  # end

  def rescue_with_badge_not_found
    render plain: 'Badge was not found'
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:name, :description)
  end
end
