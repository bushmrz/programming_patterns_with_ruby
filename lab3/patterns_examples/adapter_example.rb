# Паттерн Адаптер - это паттерн проектирования, который позволяет двум несовместимым интерфейсам работать вместе.
# Он используется, когда интерфейс существующего класса несовместим с тем, что требуется клиенту.
# Создавая адаптер, существующий класс можно повторно использовать в новом контексте
# без необходимости изменения исходного кода.

class Rectangle
  def initialize(width, height)
    @width = width
    @height = height
  end

  def area
    @width * @height
  end
end

class TriangleAdapter
  def initialize(rectangle)
    @rectangle = rectangle
  end

  def area
    @rectangle.area / 2.0
  end
end

# Client
rectangle = Rectangle.new(6,4)
triangle = TriangleAdapter.new(rectangle)
puts "Triangle area: #{triangle.area}"
