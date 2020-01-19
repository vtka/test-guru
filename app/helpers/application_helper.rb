module ApplicationHelper
  def flash_bootstrap(key)
    if key == 'alert'
      key = 'danger'
    elsif key == 'notice'
      key = 'primary'
    end
  end

  def format_seconds(seconds_to_format = 0)
    return '-' if seconds_to_format <= 0

    Time.at(seconds_to_format).utc.strftime('%H:%M:%S')
  end
end
