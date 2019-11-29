module BadgeRules
  class BaseRule
    def call(user, badge, value)
      @user = user
      @badge = badge
      @value = value
      EarnedBadge.create!(user: user, badge_id: badge) if actual >= expected
    rescue ActiveRecord::RecordNotUnique
      false
    end

    def actual
      raise NotImplementedError
    end

    def expected
      raise NotImplementedError
    end
  end
end
