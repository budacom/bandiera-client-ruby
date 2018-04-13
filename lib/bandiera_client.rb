require 'bandiera/client'

module Bandiera
  class << self
    attr_accessor :host
    attr_accessor :port
    attr_accessor :default_group
    attr_accessor :logger

    def configure
      yield self
      @client = Client.new("http://#{@host}:#{@port}", @logger || Logger.new($stdout))
    end

    def on?(_feature, _group = @default_group || 'default', _params = {}, _http_options = {})
      @client.enabled?(_group, _feature, _params, _http_options)
    end
  end
end
