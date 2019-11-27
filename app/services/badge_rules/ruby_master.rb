module BadgeRules
  class RubyMaster
    def call(test_passage, badge_id)
      if test_passage.test.title == 'Ruby' && test_passage.successful?
        puts test_passage.test.title
        EarnedBadge.create!(user_id: test_passage.user.id,
                            badge_id: badge_id)
      end
    rescue ActiveRecord::RecordNotUnique
      false
    end
  end
end

# EarnedBadge.where(user_id: test_passage.user.id)


# success_test_passages = user.test_passages.where(success: true)
# ruby_test_passages = success_test_passages.where(test_id: Test.where(category: «ruby»).pluck(:id))