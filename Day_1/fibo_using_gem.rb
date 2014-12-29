require "fibonacci"

fibo_gems = Fibonacci.new()
fibo_series = fibo_gems.terms(20)
puts fibo_series.to_s