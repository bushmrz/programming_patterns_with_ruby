require 'sqlite3'
require_relative 'work_with_db_students.rb'
require_relative 'students_list_db.rb'

# Создаем объект класса Students_list_db



students_list = Students_list_DB.new('students_db.db')

# Получаем студента по ID
student1 = students_list.get_student(1)

# Создаем нового студента
new_student = Student.new(name: 'Alexa', age: 22, telegram: '@bot_lexa')

# Добавляем нового студента в список
students_list.add_student(new_student)

# Заменяем данные студента с id=2
student2 = students_list.get_student(2)
student2.name = 'Erik'
students_list.replace_student(student2)

# Удаляем студента с id=3
students_list.delete_student(3)

# Получаем количество студентов в списке
num_students = students_list.count_students
puts(num_students)


