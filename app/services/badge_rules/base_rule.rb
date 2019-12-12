module BadgeRules
  class BaseRule
    def initialize(user, test_passage, badge)
      @user = user
      @test_passage = test_passage
      @badge = badge
    end
  end
end
