# returns whether the number is prime or not

def is_prime (num)
  num = num.abs;
  if(num == 2)
    return "is Prime"
  end
  sqrt_num = Math.sqrt(num).ceil
  (2..sqrt_num).each do |x|
    return "is Composite" if (num%x == 0)
  end
  "is Prime"
end
print "Enter a number: "
num = gets.chomp
begin
  puts is_prime(Integer(num))
rescue
  puts "Please enter a valid number"
end
