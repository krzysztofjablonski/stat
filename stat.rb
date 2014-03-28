require 'rubygems'
require 'rack'

require './lib/stat.rb'

class StatServer
  def initialize
    @stat = Stat::Stat.new
  end

  def call env
    if env['QUERY_STRING'] == "key=123"
      [200, {"Content-Type" => "application/json"}, [@stat.stats]]
    else
      [401, {"Content-Type" => "text/html"}, ['Unauthorized']]
    end
  end
end


Rack::Handler::Thin.run StatServer.new, :Port => 9669
