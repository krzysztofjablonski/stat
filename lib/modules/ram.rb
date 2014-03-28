module Stat
  module Ram
    def self.results
      output = %x{free -m}
      output = output.lines[1].split(/\s+/)
      total = output[1].to_i
      used = total - output.last(4).map(&:to_i).reduce(&:+)
      percentage = (used.to_f/total).round(2)

      {
        used: used,
        total: total,
        percentage: percentage
      }
    end
  end
end
