# frozen_string_literal: true

# :nodoc:
class Stopwatch
  def start
    @start = Time.now
    puts 'Pradzia: ' + @start.to_s
  end

  def elapsed_time
    now = Time.now
    elapsed = now - @start.to_i
    puts 'Pradzia: ' + @start.to_s
    puts 'Dabartinis: ' + now.to_s
    puts 'Praejas laikas: ' + elapsed.to_s + ' seconds'
    @start = 0
  end

  def show_time
    now = Time.now
    elapsed = now - @start.to_i
    puts ''
    puts 'Praejo: ' + elapsed.to_s + ' seconds'
  end
end

i = 0

while i != 1

  puts '1. Pradeti'
  puts '2. Stabdyti'
  puts '3. Rodyti esama'
  puts '4. exit'

  s = Stopwatch.new

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
