module TaskHelper

  def should_it_run?(monitor,datetime=Time.zone.now)
    frequency = monitor.frequency
    active = monitor.active?
    if !active
      false
    elsif minute(datetime) % frequency  == 0
      true
    elsif round_minute_to_next_hour(frequency) == hour(datetime)
      true
    elsif nil
      # Logic for daily tasks
    elsif nil
      # Logic for weekly tasks
    else
      false
    end
  end

  def minute(datetime=Time.zone.now)
    minute = datetime.strftime('%M').to_i
    if minute == 0
      60
    else
      minute
    end
  end

  def hour(datetime=Time.zone.now)
    datetime.strftime('%H')
  end

  def day_of_week(datetime=Time.zone.now)
    datetime.strftime('%A')
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
