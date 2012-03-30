MoIP.setup do |config|
  config.uri = ENV["MOIP_CONFIG_URI"]
  config.token = ENV["MOIP_CONFIG_TOKEN"]
  config.key = ENV["MOIP_CONFIG_KEY"]
end