#! /usr/bin/env ruby
# phase.rb - prints out shifting mirror text
# -- ./phase.rb "Text" [CHAR_LIMIT]

class Mirror
  def mirror_string
    @string + " " + @string.reverse
  end

  def initialize(string, limit)
    limit ||= 8000
    @string = string.dup

    line_legth = mirror_string.length + 1    # This is character count for one line including newline
    limit = (limit || 8000).to_i        # Second arg, char limit of output

    @times = (limit / line_legth).floor    
  end

  def print_phase
    (0...@times).each do |n|
      puts mirror_string
      @string << @string.slice!(0)
    end
  end
end

mirror = Mirror.new(ARGV[0], ARGV[1])
mirror.print_phase