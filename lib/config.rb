class Configuration
	def initialize
		config_files = [ "config.yml", "config-sample.yml" ]
		config_files.each do |config_file|
			begin
				@config = YAML::load(File.open($APPLICATION_ROOT + '/' + config_file))
			rescue
				next
			end
		end
		raise 'Configuration file not found' if @config.nil?
	end

	def get_configuration
		@config
	end
end

