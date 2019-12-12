module BadgeRules
  class CategoryMaster < BaseRule
    def call
      if @user.test_passages.in_category(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length < Test.in_category(@badge.value.to_i).count && @user.earned_badges.where(badge_id: @badge.id).count == 0
        false
      elsif @user.test_passages.in_category(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length == Test.in_category(@badge.value.to_i).count
        @user.test_passages.in_category(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min == @user.earned_badges.where(badge_id: @badge.id).count + 1
      else
        @user.test_passages.in_category(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min >= @user.earned_badges.where(badge_id: @badge.id).count + 1
      end
    end
  end
end
