class WebWorker
  include Sidekiq::Worker

  def perform(web_monitor_id)
    web_monitor = WebMonitor.find(web_monitor_id)
    uri = URI(web_monitor.url)
    res = Net::HTTP.get_response(uri)
    if res.code == '200'
      p = web_monitor.WebResults.build(
        successful: true,
        )
      # Create alert
    else
      p = web_monitor.WebResults.build(
        successful: false,
        status_code: res.code
        )
    end
    p.save
  end
end
