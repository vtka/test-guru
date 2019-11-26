class BadgeService
  def call(test_passage)
    Badge.all.each do |badge|
      # puts badge
      badge_rule = "BadgeRules::#{badge.rule}".constantize.new
      # puts badge_rule
      badge_rule.call(test_passage, badge.id)
    end
  end
end
