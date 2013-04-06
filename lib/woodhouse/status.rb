require 'woodhouse'
require "woodhouse/status/version"
require 'reel/app'

module Woodhouse
  module Status

    class App
      include Reel::App

      get "/" do |request|
        [404, { }, " "]
      end

      get "/status" do |request|
        [200, { "Content-Type" => "application/json" }, Woodhouse.watchdog.status_report.to_json ]
      end
    end

    def self.install_extension(configuration, opts = {}, &blk)
      port = opts.fetch(:port)
      host = opts.fetch(:host, "127.0.0.1")

      configuration.at(:server_start) do
        App.new(host, port)
        configuration.logger.info "Status server listening on http://#{host}:#{port}."
      end
    end

  end

  def self.install_extension(configuration, opts = {}, &blk)
    port = opts.fetch(:port)
    host = opts.fetch(:host, "127.0.0.1")

    configuration.at(:server_start) do
      App.new(host, port)
      configuration.logger.info "Status server listening on http://#{host}:#{port}."
    end
  end

end
