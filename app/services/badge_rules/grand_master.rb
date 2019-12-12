module BadgeRules
  class GrandMaster < BaseRule
    def call
      if @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length < Test.in_category(@badge.value.split(",").map { |s| s.to_i }).count && @user.earned_badges.where(badge_id: @badge.id).count == 0
        false
      elsif @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length == Test.in_category(@badge.value.split(",").map { |s| s.to_i }).count
        @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min == @user.earned_badges.where(badge_id: @badge.id).count + 1
      else
        @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min >= @user.earned_badges.where(badge_id: @badge.id).count + 1
      end
    end
  end
end

# module BadgeRules
#   class GrandMaster < BaseRule
#     def call
#       group_length = @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val }.length
#       group_min = @user.test_passages.in_category(@badge.value.split(",").map { |s| s.to_i }).success.pluck(:title).group_by { |elem| elem }.map { |key, val| val.count }.min
#       scope_count = Test.in_category(@badge.value.split(",").map { |s| s.to_i }).count
#       badges_count = @user.earned_badges.where(badge_id: @badge.id).count

#       if group_length < scope_count && badges_count == 0
#         false
#       elsif group_length == scope_count
#         group_min == (badges_count + 1)
#       else
#         group_min >= (badges_count + 1)
#       end
#     end
#   end
# end
