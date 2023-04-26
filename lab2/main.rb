# require 'json'
# require_relative './Student.rb'
# require_relative './student_short.rb'
# require_relative './DataTable_task3//data_list.rb'
# require_relative './DataTable_task3//data_list_student_short.rb'
# require_relative './templates/data_constructor.rb'
# require_relative './templates/base_filter.rb'
# require_relative './student_list_txt.rb'
# require_relative './converter.rb'
#
# std_list_txt = StudentListTxt.new()
#
# std_list_txt.read_from_txt("./lab2/students_db.txt")
# puts std_list_txt.get_student_short_count
# puts std_list_txt.get_by_id(2)
# puts std_list_txt.sort_by_fio
# puts (std_list_txt.get_k_n_student_short_list(1,2)).inspect
# std_list_txt.delete_student(1)
# puts std_list_txt.get_student_short_count
# std_list_txt.write_to_txt("./lab2/new_dataset.txt")
#
# yaml = StudentList.new(ConverterYAML.new)
# json = StudentList.new(ConverterJSON.new)
# txt = StudentList.new(ConverterTxt.new)
#
# yaml.read_file('./lab2/studentsRead.yaml')
# json.read_file('./lab2/studentsRead.json')
# txt.read_file('./studentsRead.txt')
#
#
# puts(yaml.students)
# puts(json.students)
# puts(txt.students)
#
# yaml.add_student(Student.from_str('fio: Ггг Ггг ГГ'))
# json.add_student(Student.from_str('fio: Дог Ди Давич'))
# txt.add_student(Student.from_str('fio: Гвщ Гб Гзщзлович'))
#
# yaml.write_file('/home/dmitry/RubyLabs/Lab2/studentsWrite.yaml')
# json.write_file('/home/dmitry/RubyLabs/Lab2/studentsWrite.json')
# txt.write_file('/home/dmitry/RubyLabs/Lab2/studentsWrite.txt')
#
#


require 'sqlite3'


db = SQLite3::Database.new 'students_db.db'

db.execute("SELECT * FROM student") do |row|
  puts row.join("\t")
end