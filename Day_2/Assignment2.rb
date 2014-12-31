# checks whether the sum of array elements is equal to equal_to
# also checks whether the element repetition has occurred or not
def is_equal_to?(array,equal_to,used_elements)
  sum = 0

  array.each do
  |x| if(used_elements.include?x)
        return false
      else
        sum += x
      end
  end

  if (sum == equal_to)
    return true
  else
    return false
  end

end

# main function to distribute evenly the array elements
def distribute (array,no_of_divs)

# eliminate the repeated elements
  array.uniq!

  sum = 0
  array.each do
  |x| sum += x
  end
  if((sum%no_of_divs) != 0)
    puts "Cannot Distribute Evenly!!!!"
    return Array.new(1)
  end

  avg = sum / no_of_divs

# final distribution
  result = Array.new()
# array to keep track of used elements
  used_elements = Array.new(1)

  (1..array.length).each do # iterate through the whole array
  |i| array.combination(i).each do # iterate through each combination
    |j| if(is_equal_to?(j,avg,used_elements))
          result << j
          j.each {|x| used_elements << x} #prepend in used_elements the elements of j
          used_elements = (used_elements.uniq).compact # make used_elements PURE
        end
    end
  end

  if((result.length != no_of_divs) || (used_elements.length != array.length))
    puts "Cannot Distribute Evenly!!!"
    return Array.new(1)
  else
    return result
  end

end


puts (distribute([1,2,3,4,5,6,7,8,9],5)).to_s