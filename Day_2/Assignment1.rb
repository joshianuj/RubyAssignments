#Write a custom iterator for map method.

#puts [1,2,3].map{|a| a*2}

def newMap(array)
  n= 0
  op = []
  while n<array.length
    op[n] = yield array[n]
    n+=1
  end
  op
end

map = newMap([1,2,3]){|a| a*a}
print map