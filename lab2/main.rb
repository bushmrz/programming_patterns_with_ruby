require_relative './Student.rb'
require_relative './student_short.rb'
def read_from_txt(filename)
  File.read(filename)
      .split("\n")
      .map { |txt| Student.parse_str(txt) }
end

puts read_from_txt("lab2/students_db.txt")