module Stat
  module Cpu
    def self.results
      output = %x{uptime}
      output = output.split(' ').last(3)

      {
        load1: output[0],
        load5: output[1],
        load15: output[2]
      }
    end
  end
end
