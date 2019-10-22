# frozen_string_literal: true

# :nodoc:
class Stopwatch
  def start
    @start = Time.now
  end

  def elapsed_time
    now = Time.now
    elapsed = now - @start
    puts 'Started: ' + @start.to_s
    puts 'Now: ' + now.to_s
    puts 'Elapsed time: ' + elapsed.to_s + ' seconds'
    elapsed.to_s
    @start = 0
  end

  def show_time
    now = Time.now
    elapsed = now - @start
    puts ''
    puts 'Praejo: ' + elapsed.to_s + ' seconds'
  end
end

## Usage
s = Stopwatch.new
i = 0

while i != 1

  puts '1. Pradeti'
  puts '2. Stabdyti'
  puts '3. Rodyti esama'
  puts '4. exit'

  x = gets.chomp.to_i

  case x
  when 1
    s.start
  when 2
    s.elapsed_time
  when 3
    s.show_time
  when 4
    i = 1
    puts 'bye'
  else
    "You gave me #{x} -- I have no idea what to do with that."
  end

end

## Output
# Started: Tue Sep 03 11:44:48 +0100 2013
# Now: Tue Sep 03 11:44:50 +0100 2013
# Elapsed time: 2.000997 seconds
# 2.000997
