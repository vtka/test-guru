class BadgesController < ApplicationController
  # Test Controller
  # before_action :set_tests, only: %i[index update_inline]
  def index
    @badges = Badge.all
  end
end
