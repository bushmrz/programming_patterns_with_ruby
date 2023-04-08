require_relative './Student.rb'
require_relative './student_short.rb'
require_relative './DataTable_task3/data_list_student_short.rb'
class StudentListTxt
  attr_accessor :students, :unic_id

  def initialize()
    self.students = []
    self.unic_id = students.count + 1
  end

  def read_from_txt(filename)
    raise ArgumentError.new("File not found #{filename}") unless File.file?(filename)

      File.read(filename)
          .split("\n")
          .map { |txt| students << Student.parse_str(txt) }
  end

  def write_to_txt(filename)
    File.open(filename, 'w') { |file|
      file.write(
        students.map { |el| el.to_s }
                .join("\n")
      )
    }
  end

  def get_by_id(id)
    self.students.detect{|x| x.id == id.to_s}
  end

  def get_k_n_student_short_list(k,n, existing_data: nil)
    skip = (k-1) * n
    new_data = students[skip, n].map{|student| StudentShort.from_student(student)}

    return DataListStudentShort.new(data:new_data) if existing_data.nil?

    existing_data.append(new_data)
  end

  def sort_by_fio
    self.students.sort_by(&:fio_info)
  end

  def add_student(student)
    student.id = next_id
    self.students.append(student)
  end

  def delete_student(id)
    index = students.index(students.detect { |x| x.id == id.to_s })
    self.students.delete_at(index)
  end

  def replace_student(id, student)
    self.students.map! { |x| x.id == id.to_s ? student : x }
  end

  def get_student_short_count()
    self.students.count
  end

  def next_id
    self.unic_id=students.max_by(&:id) + 1
  end

end

