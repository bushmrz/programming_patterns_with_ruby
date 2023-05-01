require './lab3/all_data/db_data_source'
require './models/student'
require './models/student_short'
require './all_data/data_list_student_short'

class DBSourceAdapter
  def initialize(source)
    @source = source
    @students = adapter.get_students
  end

  def adapter
    if @source.include?('.txt')
      TxtAdapter.new(@source)
    elsif @source.include?('.json')
      JSONAdapter.new(@source)
    elsif @source.include?('.yml')
      YamlAdapter.new(@source)
    else
      raise "Неверный формат файла"
    end
  end

  def get_student_by_id(id)
    @students.each do |student|
      return student if student.id == id
    end
    nil
  end

  def get_students_short(n, k)
    start_index = (n - 1) * k
    end_index = start_index + k - 1
    students_short = []
    @students[start_index..end_index].each do |student|
      students_short << StudentShort.new(student.id, student.name)
    end
    students_short
  end

  def add_student(name, age, email)
    id = @students.last.id + 1
    student = Student.new(id, name, age, email)
    @students << student
    adapter.save_students(@students)
  end

  def replace_student(id, name, age, email)
    @students.each do |student|
      if student.id == id
        student.name = name
        student.age = age
        student.email = email
        adapter.save_students(@students)
        return true
      end
    end
    false
  end

  def delete_student(id)
    @students.each_with_index do |student, index|
      if student.id == id
        @students.delete_at(index)
        adapter.save_students(@students)
        return true
      end
    end
    false
  end

  def get_student_short_count
    @students.count
  end

  def save_students(students)
    File.open(@file_path, "w") do |file|
      students.each do |student|
        file.puts "#{student.id},#{student.name},#{student.age},#{student.email}"
      end
    end
  end
end