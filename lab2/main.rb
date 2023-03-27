require_relative './Student.rb'
require_relative './student_short.rb'
require_relative './DataTable_task3//data_list.rb'
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
# students_list =  read_from_txt("lab2/students_db.txt")
# students_list[0].set_contacts(phone: "+79897776655")
# write_to_txt("lab2/new_stud_db.txt", students_list)
# puts read_from_txt("lab2/new_stud_db.txt")

stud1 = Student.new(last_name: 'Aa', first_name: 'Oo', second_name: 'Ee',opt: { id:'28', git:'@elelelel', mail: 'ewewewe@mail.ru' })
stud2 = Student.new(last_name: 'Aa', first_name: 'Oo', second_name: 'Ee',opt: { id:'2', git:'@elelelel', mail: 'ewewewe@mail.ru' })
stud3 = Student.new(last_name: 'Aa', first_name: 'Oo', second_name: 'Ee',opt: { id:'8', git:'@elelelel', mail: 'ewewewe@mail.ru' })
stud4 = Student.new(last_name: 'Aa', first_name: 'Oo', second_name: 'Ee',opt: { id:'35', git:'@elelelel', mail: 'ewewewe@mail.ru' })

stud1 = StudentShort.from_student(stud1)
stud2 = StudentShort.from_student(stud2)
stud3 = StudentShort.from_student(stud3)
stud4 = StudentShort.from_student(stud4)

stud_list = DataList.new([stud1, stud2, stud3, stud4])
stud_list.select(3)
stud_list.select(4)
puts stud_list.get_selected
