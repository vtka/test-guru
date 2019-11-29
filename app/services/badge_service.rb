class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @badges = []
    @user = test_passage.user
  end

  def call
    Badge.all.each do |badge|
      badge_rule = "BadgeRules::#{badge.rule}".constantize.new(@user, badge.value)

      if badge_rule.call
        @badges << EarnedBadge.new(user_id: @user.id, badge_id: badge.id)
      end
    end
    @badges
  end
end
