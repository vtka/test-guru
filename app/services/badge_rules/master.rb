module BadgeRules
  class Master < BaseRule
    def actual
      @user.test_passages.in_category([1, 2, 3]).with_level(1).success.map{ |tp| tp.test.category_id }.uniq.count
    end

    def expected
      Test.categories_easy.count
    end
  end
end
