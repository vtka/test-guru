module BadgeRules
  class Master < BaseRule
    def call
      if @user.test_passages.with_level(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length < Test.easy.count && @user.earned_badges.where(badge_id: @badge.id).count == 0
        false
      elsif @user.test_passages.with_level(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length == Test.easy.count
        @user.test_passages.with_level(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min == @user.earned_badges.where(badge_id: @badge.id).count + 1
      else
        @user.test_passages.with_level(@badge.value.to_i).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min >= @user.earned_badges.where(badge_id: @badge.id).count + 1
      end
    end
  end
end
