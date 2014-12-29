# returns the fibonacci of the given number

def fibonacci num
  if num == 0
    return [0]
  end

  fibo = Array.new()
  x = 0
  y = 1
  fibo << x
  fibo << y

  (3..num).each do
    z = x + y
    x,y = y,z
    fibo << y
  end

  fibo

end

puts (fibonacci 20).to_s