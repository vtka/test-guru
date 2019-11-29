module BadgeRules
  class CategoryMaster < BaseRule
    def actual
      @user.test_passages.in_category(@value.to_i).success.map { |tp| tp.test }.uniq.count
    end

    def expected
      Test.by_category(@value.to_i).count
    end
  end
end
