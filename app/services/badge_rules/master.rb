module BadgeRules
  class Master < BaseRule
    def actual
      @user.test_passages.with_level(@value.to_i).success.map { |tp| tp.test.category_id }.uniq.count
    end

    def expected
      Test.easy.count
    end
  end
end
