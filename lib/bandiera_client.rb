require 'bandiera/client'

module Bandiera
  class << self
    attr_accessor :host
    attr_accessor :port

    def configure
      yield self
      @client = Client.new("http://#{@host}:#{@port}")
    end

    def on?(_feature, _group = 'All', _params = {}, _http_options = {})
      @client.enabled?(_group, _feature, _params, _http_options)
    end
  end
end
