class BadgeService
  def initialize(test_passage)
    @test = test_passage.test
    @user = test_passage.user
  end

  def call
    unlocked_badges = select_badges
    assign_badges(unlocked_badges)
  end

  private

  def select_badges
    Badge.all.select do |badge|
      send(badge.rule, badge.value)
    end
  end

  def assign_badges(badges)
    badges_to_assign = badges - @user.badges
    return unless badges_to_assign.count.positive?

    @user.badges << badges_to_assign
    badges_to_assign.count
  end

  def all_tests_from_category(category_name)
    return false if @test.category.title != category_name

    successful_tests_count = successful_tests_in_category.uniq.count
    return false unless successful_tests_count.positive?

    Test.by_category(@test.category.title).uniq.count == successful_tests_count
  end

  def first_try(test)
    return false if @test.title != test

    @user.test_passages.where(test_id: @test.id).where('success = ?', true).count == 1
  end

  def all_tests_on_level(level)
    return false if @test.level != level.to_i

    successful_tests_count = successful_tests_on_level.uniq.count
    return false unless successful_tests_count.positive?

    Test.by_level(@test.level).uniq.count == successful_tests_count
  end

  def successful_tests_in_category
    successful_tests.where(category_id: @test.category.id)
  end

  def successful_tests_on_level
    successful_tests.where(level: @test.level)
  end

  def successful_tests
    @user.tests.merge(TestPassage.where('success = ?', true))
  end
end
