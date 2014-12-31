#Write a custom iterator for map method.

#puts [1,2,3].map{|a| a*2}

def newMap(array)
  op = []
  (0...array.length).each do |n|
    op[n] = yield array[n]
  end
  op
end

map = newMap([1,2,3]){|a| a*a}
print map