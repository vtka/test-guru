module BadgeRules
  class GrandMaster < BaseRule
    def call
      group_length = @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length
      scope_count = Test.in_category(@badge.value.split(",").map { |s| s.to_i }).count
      badge_count = @user.earned_badges.where(badge_id: @badge.id).count
      group_min = @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min

      if group_length < scope_count && badge_count == 0
        false
      elsif group_length == scope_count
        group_min == badge_count + 1
      else
        group_min >= badge_count + 1
      end
    end
  end
end
