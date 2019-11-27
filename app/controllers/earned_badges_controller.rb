class EarnedBadgesController < ApplicationController
  before_action :authenticate_user!

  def index
    @earned_badges = EarnedBadge.all
  end
end
