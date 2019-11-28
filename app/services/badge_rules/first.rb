module BadgeRules
  class First < BaseRule
    NUMBER_TO_SUCCEED = 1

    def actual
      @user.test_passages.success.count
    end

    def expected
      NUMBER_TO_SUCCEED
    end
  end
end
