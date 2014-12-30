#[1,2,3].each{|a| puts a}

def newEach(array)
  n=0
  while n<array.length
    yield (array[n])
    n+=1
  end
end

newEach([1,2,3]){|a| puts a}

Class Array
def newClassEach(array)
  n=0
  while n<array.length
    yield (array[n])
    n+=1
  end
end
end

[1,2,3].newClassEach{|a| puts a}

