#Write a program which has an array of diamonds with different value e.g. [1,2,3,4,5]. The program should distribute the diamonds equally to 3 people.


def distribute(array,n)

val = ( array.inject{|sum,x| sum + x } / n)
if !(val%val.round(0) == 0)
  return "Cannot Be Distributed"
else

  #calc combination having sum = val
  op = []
  (1...array.length).each do |i|
    arraytemp = array.combination(i).to_a
   (0...arraytemp.length).each do |j|
      element = arraytemp[j]
        sum=0
        (0...element.length).each do |k|
          sum += element[k]
        end
      if(sum == val)
        op << element
      end
    end
  end

  #remove duplicate combinations
 (0...op.length-1).each do |i|
   (i+1...op.length).each do |j|
      check = true
      (0...op[i].length).each do |i1|
        (0...op[j].length).each do |i2|
          if(op[i][i1] == op[j][i2])
            check = false
          end
        end
      end
      if(check ==false)
        op[j] = [nil]
      end
    end
  end
  op.each do
  |x| x.compact!
  end
  op.delete([])

  #remove invalid combinations number
  if(op.length<n)
    return "Cannot Be Distributed"
  else
    op
  end

  #invalid if not onto
  temp = []
  (0...op.length).each do |i|
    (0...op[i].length).each do |j|
        temp << op[i][j]
    end
  end
  if(temp.length == array.length)
    op
  else
    return "Cannot Be Distributed"
  end

end

end

#a = [4,5,6,8,1,3]
#a = [1,2,3,4,5,232,3243,23423]
a = [1,2,3,4,5,6,7,8,9]
print distribute(a,3)