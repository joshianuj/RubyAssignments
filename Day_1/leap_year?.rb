
# returns whether the given year is a leap year or not
def leap_year year
  if(((year%400) == 0) || (((year%4) == 0) && ((year%100) != 0)))
    return "is a leap year"
  else
    return "is not a leap year"
  end
end

print "Enter a year: "
year = gets.chomp
begin
  year = Integer(year)
    if(year>=0)
      puts leap_year(year)
    else
      puts "Please enter a valid year !!!"
    end
rescue
  puts "Please enter a valid year!!!"
end
