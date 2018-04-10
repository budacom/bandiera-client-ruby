require 'bandiera/client'

module Bandiera
  @@host = 'localhost'

  @@port = '5000'

  def self.configure
    yield self
  end

  def self.host
    @@host
  end

  def self.host=(_host)
    @@host = _host
  end

  def self.port
    @@port
  end

  def self.port=(_port)
    @@port = _port
  end

  def self.on?(_feature, _group = "All", _params = {}, _http_options = {})
    client = Client.new("http://#{@@host}:#{@@port}")
    client.enabled?(_group, _feature, _params, _http_options)
  end

end
