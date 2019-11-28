module BadgeRules
  class BackendMaster < BaseRule
    def actual
      @user.test_passages.in_category(1).with_level([1, 2, 3]).success.map { |tp| tp.test }.uniq.count
    end

    def expected
      Test.category_one.count
    end
  end
end
