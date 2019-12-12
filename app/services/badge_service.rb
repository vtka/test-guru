class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = test_passage.user
  end

  def call
    Badge.all.map do |badge|
      badge_rule = "BadgeRules::#{badge.rule}".constantize.new(@user, @test_passage, badge)

      if badge_rule.call
        EarnedBadge.new(user_id: @user.id, badge_id: badge.id)
      end
    end.compact
  end
end
