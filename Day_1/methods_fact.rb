def factorial (number=0)
  if(number== 0)
    return 1
  else
    number * factorial(number-1)
  end
end

puts factorial(4)