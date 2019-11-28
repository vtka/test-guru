module BadgeRules
  class GrandMaster < BaseRule
    def actual
      @user.test_passages.success.map { |tp| tp.test }.uniq.count
    end

    def expected
      Category.all.count
    end
  end
end
