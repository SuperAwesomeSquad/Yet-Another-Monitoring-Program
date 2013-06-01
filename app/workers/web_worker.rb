class WebWorker
  include Sidekiq::Worker
  include WorkerTemplate
  sidekiq_options :retry => false

  MonitorResult = Struct.new(:successful,:status_code, :exception)

  def perform(monitor_id)
    @monitor = find_monitor(monitor_id)
    if @monitor.nil?
      nil
    else
      do_monitor(@monitor)
    end
  end

  def do_monitor(monitor=@monitor)
    uri = URI(@monitor.url)

    begin
      res = Net::HTTP.get_response(uri)
      if res.code != '200'
        result = MonitorResult.new(false, res.code, false)
      else
        result = MonitorResult.new(true, res.code, false)
      end
    rescue => e
      exception = e.message
      result = MonitorResult.new(false, true, true)
    end

    create_result(result)
    save_result(@p)

  end

  def create_result(result)
puts result.inspect
    if result.exception
puts "I think I excepted"
      @p = WebResult.new(
        successful: false,
        status_code: result.status_code
      )
      # create_alert
    elsif result.status_code != '200'
puts "I think I didn't have 200"
      @p = WebResult.new(
        successful: false,
        status_code: result.status_code,
      )
      # create_alert
    else
puts "I think I was good"
      @p = WebResult.new(
        successful: true,
        status_code: 200
      )
    end
  end

  def save_result(result)
    result.save
  end

  def find_monitor(monitor_id)
    monitor = WebMonitor.find_by_id(monitor_id)
    if monitor
      monitor
    else
      nil
    end
  end
end
