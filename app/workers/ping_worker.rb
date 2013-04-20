class PingWorker
	include Sidekiq::Worker
	include WorkerTemplate

	def perform(ping_id)
		monitor = PingMonitor.find(ping_id)
		ping = Net::Ping::External.new(monitor.hostname)
		ping.ping
		if ping.exception
			p = monitor.PingResults.build(
				successful: false,
				duration: 'null'
				)
			create_alert
		else
			p = monitor.PingResults.build(
				successful: true,
				duration: ping.duration
				)
		end
		p.save
	end
end
