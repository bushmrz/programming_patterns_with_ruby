require_relative './Student.rb'
require_relative './student_short.rb'
def read_from_txt(filename)
  File.read(filename)
      .split("\n")
      .map { |txt| Student.parse_str(txt) }
end

def write_to_txt(filename, students)
  File.open(filename, 'w') { |file|
    file.write(
      students.map { |student| student.to_s }
              .join("\n")
    )
  }
end
students_list =  read_from_txt("lab2/students_db.txt")
students_list[0].set_contacts(phone: "+79897776655")
write_to_txt("lab2/new_stud_db.txt", students_list)
puts read_from_txt("lab2/new_stud_db.txt")