class EarnedBadgesController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_test, only: %i[start]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @earned_badges = EarnedBadge.all
  end

  # def start
  #   current_user.tests.push(@test)
  #   redirect_to current_user.test_passage(@test)
  # end

  # private

  # def set_badge
  #   @earned_badge = EarnedBadge.find(params[:id])
  # end
end