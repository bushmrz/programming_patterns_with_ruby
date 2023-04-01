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
