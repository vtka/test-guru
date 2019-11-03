module ApplicationHelper
  def flash_bootstrap(key)
    if key == 'alert'
      key = 'danger'
    elsif key == 'notice'
      key = 'primary'
    end
  end

  def controller_link(text, href)
    "<a href='#{href}'>#{text}</a>".html_safe
  end
end
