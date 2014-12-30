def sum(name="null",*salary)
  puts name
  n = 0
  sum = 0
  while (n < salary.length)
    sum += salary[n]
    n+=1
  end
  "Total Salary : #{sum}"
end

puts sum("abc",1,2,3)