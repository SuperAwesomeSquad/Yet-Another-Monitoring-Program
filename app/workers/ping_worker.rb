class PingWorker
	include Sidekiq::Worker

	def perform(ping_id)
		monitor = PingMonitor.find(ping_id)
		ping = Net::Ping::External.new(monitor.hostname)
		ping.ping
		if ping.exception
			p = monitor.PingResults.build(
				successful: false,
				duration: 'null'
				)
			# Create alert
		else
			p = monitor.PingResults.build(
				successful: true,
				duration: ping.duration
				)
		end
		p.save
	end
end
