# frozen_string_literal: true

puts 'Iveskite naturaluji skaiciu: '
input = gets.to_i

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

puts "Gautas Rezultatas: #{metodas(input)}"
