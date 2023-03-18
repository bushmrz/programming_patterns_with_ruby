require_relative './Student.rb'
require_relative './student_short.rb'
# student1 = Student.new(last_name: "Шнайдер", first_name: "Ия", second_name: "Александровна", opt: {id: "9898", mail: "sixzerosixbae@vk.com", telegram: "@darlinmrz", git: "@bushokmrz"})
student2 = Student.new(last_name: "Киц", first_name: "Олег", second_name: "Валерьевич", opt: {id: "99", phone: "+79009090900"})
# student3 = Student.new(last_name: "Иванов", first_name: "Иван", second_name: "Иванович", opt: {id: "2", phone: "+7 999-898-98-89"})
#
# puts student1
# puts student2
# puts student3

student4 = Student.parse_str("last_name: Test; first_name: Test; second_name: Test; git: @bulba; mail: bulba@bulba.com")
puts student4
# puts student4.getInfo

# student5 = Student_short.from_student(student4)
# puts student5

student6 = Student_short.parse_str(12, "fio: Шнайдер.И.А; git: @darling; mail: hater@hate.ru")
puts student6