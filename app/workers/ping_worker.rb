class PingWorker
	include Sidekiq::Worker

	def perform(ping_id)
		monitor = Ping.find(ping_id)
		ping = Net::Ping::External.new(monitor.hostname)
		ping.ping
		if ping.exception
			p = monitor.PingResults.build(
				successful: false,
				exception: ping.exception
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
