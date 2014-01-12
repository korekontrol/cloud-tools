class FogGateway
	def initialize(config)
		@config = config
	end
	
	def get_dns_config
		@config['providers']['dns'] || @config['providers']['default']
	end
	
	def dns
		@dns ||= Fog::DNS.new(get_dns_config)
	end
end

