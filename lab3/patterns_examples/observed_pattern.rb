# require 'observer'
class Cat
  # include Observable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def birth
    changed
    notify_observers
  end

  def add_observer(observer)
    @observers ||= []
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers&.each { |observer| observer.update(self) }
  end
end


class CatLover
  def initialize(name)
    @name = name
  end

  def update(cat)
    puts "#{@name} has received a notification that a new cat named #{cat.name} has been born."
  end
end

cat1 = Cat.new('Whiskers')
cat2 = Cat.new('Fluffy')

lover1 = CatLover.new('Alice')
lover2 = CatLover.new('Bob')

cat1.add_observer(lover1)
cat2.add_observer(lover1)
cat2.add_observer(lover2)

cat1.birth
cat2.birth

###################################################
# Шаблон Observer(Наблюдатель) - это шаблон проектирования,
# который позволяет объекту, называемому Subject (субъект),
# поддерживать список своих зависимых, называемых Observer (наблюдатели),
# и автоматически уведомлять их, когда он изменяет свое состояние.
# Когда Subject изменяется, все его наблюдатели уведомляются и автоматически обновляются.
#
# Шаблон Observer состоит из следующих элементов:
#
# Subject: объект, который содержит текущее состояние и уведомляет наблюдателей,
#           когда его состояние изменяется.
# Observer: интерфейс, который определяет метод обновления,
#           который вызывается субъектом, когда его состояние изменяется.
# Concrete Subject: реализация субъекта, который содержит текущее состояние и уведомляет наблюдателей,
#                   когда его состояние изменяется.
# Concrete Observer: реализация наблюдателя,
#                    который получает уведомление о изменении состояния субъекта.