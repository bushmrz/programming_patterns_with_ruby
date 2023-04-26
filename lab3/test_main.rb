require 'sqlite3'
require_relative 'new_students.rb'

db = SQLite3::Database.new 'students_db.db'

Student.create_table(db)
Student.seed(db)

mike = Student.new({ last_name: 'Wendor', first_name: 'Mike', second_name: 'Alerto' })
ellar = Student.new({ last_name: 'Ever', first_name: 'Ellar', second_name: 'Eher' })
andy = Student.new({ last_name: 'Black', first_name: 'Andy', second_name: 'Whiter' })

puts mike.first_name
puts ellar.second_name
puts andy.last_name


