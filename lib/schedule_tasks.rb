module TaskHelper

  def should_it_run?(datetime,monitor)
    frequency = monitor.frequency
    active = monitor.active?
    if !active
      false
    elsif monitor.frequency % minute == 0
      true
    elsif round_minute_to_next_hour(monitor.frequency) == hour
      true
    elsif 0
      # Logic for daily tasks
    elsif 0
      # Logic for weekly tasks
    else
      false
    end
  end

  def minute
    minute = Time.zone.now.strftime('%M').to_i
    if minute == 0
      60
    else
      minute
    end
  end

  def hour
    Time.zone.now.strftime('%H')
  end

  def day_of_week
    Time.zone.now.strftime('%A')
  end


  def select_tasks_range(range)
    BaseMonitor.where(active: true, frequency_in_seconds: range)
  end

  def select_all_tasks
    BaseMonitor.where(active: true)
  end

  def round_minute_to_next_hour(m)
    if m % 60 == 0
      convert_minutes_to_hour(m)
    else
      convert_minutes_to_hour(m+(60-(m%60)))
    end
  end

  def convert_minutes_to_hour(m)
    m/60
  end

end
