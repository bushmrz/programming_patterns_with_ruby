require_relative './Student.rb'

student1 = Student.new(last_name: "Шнайдер", first_name: "Ия", second_name: "Александровна", opt: {id: "9898", mail: "sixzerosixbae@vk.com", telegram: "@darlinmrz"})
student2 = Student.new(last_name: "Киц", first_name: "Олег", second_name: "Валерьевич", opt: {phone: "+79009090900"})
student3 = Student.new(last_name: "Иванов", first_name: "Иван", second_name: "Иванович", opt: {id: "2", phone: "+7 999-898-98-89"})

puts student1
puts student2
puts student3
