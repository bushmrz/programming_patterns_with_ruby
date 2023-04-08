require_relative './Student.rb'
require_relative './student_short.rb'
require_relative './DataTable_task3//data_list.rb'
require_relative './DataTable_task3//data_list_student_short.rb'
require_relative './templates/data_constructor.rb'
require_relative './templates/base_filter.rb'
require_relative './student_list_txt.rb'

std_list_txt = StudentListTxt.new()

std_list_txt.read_from_txt("lab2/students_db.txt")
puts std_list_txt.get_student_short_count
puts std_list_txt.get_by_id(2)
puts std_list_txt.sort_by_fio
puts (std_list_txt.get_k_n_student_short_list(1,2)).inspect
std_list_txt.delete_student(1)
puts std_list_txt.get_student_short_count
std_list_txt.write_to_txt("lab2/new_dataset.txt")
