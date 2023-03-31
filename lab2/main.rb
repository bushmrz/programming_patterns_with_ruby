require_relative './Student.rb'
require_relative './student_short.rb'
require_relative './DataTable_task3//data_list.rb'
require_relative './DataTable_task3//data_list_student_short.rb'
require_relative './templates/filters.rb'
require_relative './templates/default_data_constructor.rb'
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


stud1 = Student.new(last_name: 'Aa', first_name: 'Oo', second_name: 'Ee',opt: { id:'28', git:'@elelelel', mail: 'ewewewe@mail.ru' })
stud2 = Student.new(last_name: 'Тест', first_name: 'Oo', second_name: 'Ee',opt: { id:'2', git:'@lll', mail: 'ewwe@mail.ru' })
stud3 = Student.new(last_name: 'Ддд', first_name: 'Ъъъ', second_name: 'Ee',opt: { id:'8', git:'@eeee', mail: 'ewewewe@mail.ru' })
stud4 = Student.new(last_name: 'Aa', first_name: 'Oo', second_name: 'Ee',opt: { id:'35', git:'@elelelel', mail: 'ewewewe@mail.ru' })

stud_list = [stud1, stud2, stud3, stud4].map { |student| StudentShort.from_student(student)}

filtrate = BaseFilterWithout.new()
constructor = DefaultDataConstructor.new()

datalist = DataListStudentShort.new(data:stud_list, filtered_name:MainFilter.new(f_name:filtrate), constructor:BaseDataConstruct.new(constructor:constructor))
datalist.select(3)
datalist.select(4)
puts datalist.get_selected

puts datalist.get_names
puts datalist.get_data

# students_list =  read_from_txt("lab2/students_db.txt")
# students_list[0].set_contacts(phone: "+79897776655")
# write_to_txt("lab2/new_stud_db.txt", students_list)
# puts read_from_txt("lab2/new_stud_db.txt")