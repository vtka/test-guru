module BadgeRules
  class BaseRule
    def initialize(user, value)
      @user = user
      @value = value
    end

    def call
      actual >= expected
    end

    def actual
      raise NotImplementedError
    end

    def expected
      raise NotImplementedError
    end
  end
end
