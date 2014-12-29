# converts celsius to fahrenheit

def to_fahrenheit celsius
  return (((9 * celsius) / 5) + 32).round(2)
end

print "Enter temperature(in Celsius): "
temp = gets.chomp
begin
  puts "Fahrenheit: #{to_fahrenheit Float(temp)}"
rescue
  puts "Please enter a valid temperaure!!!"
end
