x = 10
result = 0
puts "Iveskite naturaluji skaiciu: "
n = gets.to_i

  while n != 0
    skait = n % x
    result = result + (skait*x) / 10 + (skait*x)
    n = n - skait
    x = x * 10
  end

puts "Gautas Rezultatas: #{result}"