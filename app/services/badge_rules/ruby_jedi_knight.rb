module BadgeRules
  class RubyJediKnight
    def call(test_passage, badge_id)
      user = test_passage.user
      success_test_passages = user.test_passages.where(success: true)
      ruby_test_passages = success_test_passages.where(test_id: [1, 4]).pluck(:test_id)
      if ruby_test_passages.include?(1) && ruby_test_passages.include?(4)
        EarnedBadge.create!(user_id: test_passage.user.id,
                              badge_id: badge_id)
      end
    rescue ActiveRecord::RecordNotUnique
      false
    end
  end
end


# ruby_test_passages = success_test_passages.where(test_id: Test.where({ category_id: "1", level: ["1", "2"] }).pluck(:id)).where(test_id: [1, 4])
