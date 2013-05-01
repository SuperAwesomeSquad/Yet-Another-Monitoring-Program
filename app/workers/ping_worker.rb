class PingWorker
	include Sidekiq::Worker
	include WorkerTemplate
	sidekiq_options :retry => false

	PingMonitorResult = Struct.new(:successful, :return_object, :duration)

	def perform(ping_id)
		@monitor = find_monitor(ping_id)
		if @monitor.nil?
			nil
		else
			do_ping(@monitor)
		end
	end

	def do_ping(monitor)
		ping = Net::Ping::External.new(@monitor.hostname)
		ping.ping
		if ping.exception
			result = PingMonitorResult.new
			result.successful = false
		else
			result = PingMonitorResult.new
			result.successful = true
			duration = ping.duration
		end
		log_results(result)
	end

	def log_results(result)
		if ping.exception
			p = @monitor.PingResults.build(
				successful: result.successful,
				duration: 'null'
				)
			create_alert
		else
			p = @monitor.PingResults.build(
				successful: result.successful,
				duration: result.duration
				)
		end
		p.save
	end

	def find_monitor
		monitor = PingMonitor.find_by_id(ping_id)
		if monitor
			monitor
		else
			nil
		end
	end

end
