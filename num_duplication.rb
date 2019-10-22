# frozen_string_literal: true

puts 'Iveskite naturaluji skaiciu: '

input = gets.chomp

def check(input)
  input.to_i.to_s == input
end

def metodas(input)
  x = 10
  result = 0
  while input != 0
    skait = input % x
    result = result + (skait * x) / 10 + (skait * x)
    input -= skait
    x *= 10
  end
  result
end

if check(input) == true
  puts "Gautas Rezultatas: #{metodas(input.to_i)}"
else
  puts 'Invalid input!'
end
