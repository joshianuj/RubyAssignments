#Write a method that divides two numbers. Handle exception when divide by 0.

def divide (a,b)
  #puts 'i am before the raise'
  begin
    a/b
      #raise 'error occured !!' #Creates an Exception

      #rescue
      #rescue Exception
  rescue => e
    e
    #puts "i am rescued : #{e}"
  end
  #puts 'i am after the raise'
end

begin
  a = gets
  b = gets
  puts divide(a,b)
rescue => e
  puts "Invalid Input"
end

