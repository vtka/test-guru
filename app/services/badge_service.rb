class BadgeService
  def call(test_passage)
    Badge.all.each do |badge|
      badge_rule = "BadgeRules::#{badge.rule}".constantize.new
      badge_rule.call(test_passage.user, badge.id, badge.value)
    end
  end
end
