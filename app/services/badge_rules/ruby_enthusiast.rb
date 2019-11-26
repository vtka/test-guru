module BadgeRules
  class RubyEnthusiast
    def call(test_passage, badge_id)
      if test_passage.test.title == 'Ruby'
        puts test_passage.test.title
        EarnedBadge.create!(user_id: test_passage.user.id,
                            badge_id: badge_id)
      end
    rescue ActiveRecord::RecordNotUnique
      false
    end
  end
end
