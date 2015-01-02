
module Name
  attr_reader :name,:s_name
  def complete_name
      return @name+"("+@s_name+")"
    end
  end
end

class Animals
 include Name
  def initialize name,sname
    #@type = "animal"
    @name = name
    @s_name = sname
  end
end

class Human
  include Name
  def initialize fname,lname,sname
    @name = fname + " " + lname
    @s_name = sname
  end
end

#an = Animals.new 'dog','s_dog'
#p an.complete_name
h = Human.new "Ram","xx","homo saipens"
p h.complete_name
#a.complete_name
