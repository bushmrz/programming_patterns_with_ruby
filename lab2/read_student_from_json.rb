require 'json'
require_relative 'Student'
class StudentListJSON
  public
  attr_accessor :students, :gen_id

  def readFile(filename)
    file_content = File.read(filename)
    hashed_students = JSON.parse(file_content, {symbolize_names: true})
    hashed_students.each do |stud|
      puts(stud)
      students << Student.from_hash(stud)
    end
    next_id
  end

  def writeFile(hash, filename)
    File.open(filename, 'w') do |file|
      file.write(JSON.pretty_generate(hash))
    end
  end

  def initialize
    self.students = []
    self.gen_id = students.count + 1
  end

  def student_by_id(stud_id)
    students.find{|s| s.id == stud_id}
  end

  def sorted
    students.sort_by(&:fio)
  end

  def add_student(student)
    students << student
    student.id = gen_id
    next_id
  end

  def idk(k,n,existing_data: nil)
    skip = (k-1) * n
    new_data = students[skip, n].map{|s| StudentShort.from_student_class(s)}

    return DataListStudentShort.new(data: new_data) if existing_data.nil?

    existing_data.append(new_data)
  end

  def replace_student(student_id, student)
    idx = student.find{|s| s.id==student.id}
    students[idx]=student
  end

  def delete_student(student_id)
    students.reject! {|s| s.id==student.id}
  end

  def next_id
    self.gen_id=students.max_by(&:id).id + 1
  end

end

studlist = StudentListJSON.new()

studlist.readFile('./lab2/studentsRead.json')
puts(studlist.students)
studlist.add_student(Student.parse_str('fio: Воровской/Вор/Ворикович; git:@krisa'))
puts(studlist.students)
studlist.writeFile(studlist,'./lab2/studentsWrite.json')