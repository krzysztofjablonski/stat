require 'json'
require './lib/modules/cpu'
require './lib/modules/ram'

module Stat
  class Stat
    def stats
      {
        cpu: Cpu.results,
        ram: Ram.results
      }.to_json
    end
  end
end
