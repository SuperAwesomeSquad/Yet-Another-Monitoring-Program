module TaskHelper

  def will_run_at?(datetime)
    # true:false
  end

  def round_minute_to_next_hour(m)
    if m % 60 == 0
      convert_minutes_to_hour(m)
    else
      convert_minutes_to_hour(m+(60-(m%60)))
    end
  end

  private

  def convert_minutes_to_hour(m)
    m/60
  end

end
