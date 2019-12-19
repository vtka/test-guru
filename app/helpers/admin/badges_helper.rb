module Admin::BadgesHelper
  def localized_rule_type(rule)
    I18n.t("badges.form.rule.#{rule}")
  end

  def rule_type_options
    Badge::RULE_TYPES.map { |type| [t("badges.form.rule.#{type}"), type] }
  end
end
