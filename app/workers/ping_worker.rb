class PingWorker
  include Sidekiq::Worker
  include WorkerTemplate
  sidekiq_options :retry => false
  # This is derpy
  MonitorResult = Struct.new(:successful, :duration)

  def perform(monitor_id)
    @monitor = find_monitor(monitor_id)
    if @monitor.nil?
      nil
    else
      do_monitor
    end
  end

  def do_monitor
    ping = Net::Ping::External.new(@monitor.hostname)
    ping.ping # >8U
    #result = ''
    if ping.exception.nil?
      result = MonitorResult.new(true, ping.duration)
    else
      result = MonitorResult.new(false, nil)
    end
    create_result(result)
    save_result(@p)
  end

  def create_result(result)
    if result.successful
      @p = PingResult.new(
        successful: result.successful,
        duration: result.duration
      )
      # create_alert
    else
      @p = PingResult.new(
        successful: result.successful,
      )
    end
  end

  def save_result(result)
    result.save
  end

  def find_monitor(monitor_id)
    monitor = PingMonitor.find_by_id(monitor_id)
    if monitor
      monitor
    else
      nil
    end
  end

end
