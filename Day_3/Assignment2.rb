#Write a program that has Shape class with method area. Circle and Rectangle inherits the Shape class. Circle can be initialised with radius and rectangle can be initialised with length and breadth. Both circle and rectangle objects should display correct areas.

class Shape
  def area
    if(@type == "circle")
      return (3.14*@radius**2)
    end
    if(@type == "rectangle")
      return (@length*@breadth)
    end
  end
end

class Circle < Shape
  def initialize(radius)
    @radius = radius
    @type = "circle"
  end
end

class Rectangle < Shape
  def initialize(length,breadth)
    @type = "rectangle"
    @length = length
    @breadth = breadth
  end
end

c = Circle.new 4
carea = c.area
puts "Circle area = #{carea}"

r = Rectangle.new 4,5
rarea = r.area
puts "Rectangle area = #{rarea}"
