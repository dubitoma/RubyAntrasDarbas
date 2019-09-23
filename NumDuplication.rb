x = 10
result = 0
puts "Input number: "
N = gets.to_i

  while N != 0
    skait = N % x
    result = result + (skait*x) / 10 + (skait*x)
    N = N - skait
    x = x * 10
  end

puts result