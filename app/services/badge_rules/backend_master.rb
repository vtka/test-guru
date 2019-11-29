module BadgeRules
  class BackendMaster < BaseRule
    def actual
      @user.test_passages.in_category(1).success.map { |tp| tp.test }.uniq.count
    end

    def expected
      Test.by_category('back-end').count
    end
  end
end
