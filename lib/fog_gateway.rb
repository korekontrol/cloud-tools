class FogGateway
	def initialize(config)
		@config = config
	end
	
	def get_dns_config
		@config['providers']['dns'] || @config['providers']['default']
	end
	
	def get_compute_config
		@config['providers']['compute'] || @config['providers']['default']
	end
	
	def dns
		@dns ||= Fog::DNS.new(get_dns_config)
	end
	
	def rackspace_loadbalancer
		@rackspace_loadbalancer ||= Fog::Rackspace::LoadBalancers.new(get_compute_config)
	end

end

