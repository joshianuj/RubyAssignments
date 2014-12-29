
# returns whether the given year is a leap year or not
def leap_year? year
  if(((year%400) == 0) || (((year%4) == 0) && ((year%100) != 0)))
    return "is a leap year"

  else
    return "is not a leap year"
  end
end

print "Enter a year: "
year = gets.chomp
begin
  puts leap_year? Integer(year)
rescue
  puts "Please enter a valid year!!!"
end
