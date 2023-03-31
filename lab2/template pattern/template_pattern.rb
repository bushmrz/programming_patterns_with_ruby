class TemplatePattern
  attr_accessor :x, :y
  def initialize(x,y)
    self.x = x
    self.y = y
  end

  def get_sum
    self.x+self.y
  end

  def get_sq
    [self.x**2, self.y**2]
  end

  def mult
    x*y
  end
end

class EditBase1<TemplatePattern
  def get_sq
    self.y**2
  end

  def mult
    10*x*y
  end
end

class EditBase2<TemplatePattern
  def get_sum
    self.x + rand(100)+1
  end

end
e = TemplatePattern.new(2,3)
puts e.get_sq
puts e.mult
puts e.get_sum
r = EditBase1.new(2,4)
puts r.get_sq
puts r.mult
t = EditBase2.new(1,9)
puts t.get_sum

