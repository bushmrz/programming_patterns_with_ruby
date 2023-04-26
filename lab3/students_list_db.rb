class Students_list_DB

  #freeze не позволяет изменять имя
  db_name = 'students_db.db'.freeze

  def initialize(db_name)
    @db = SQLite3::Database.new(db_name)
  end

  def close
    @db.close
  end

  def get_student(id)
    row = @db.get_first_row("SELECT * FROM students WHERE id = ?", id)
    if row.nil?
      return nil
    else
      return Student.new(id: row[0], name: row[1], age: row[2], telegram: row[3])
    end
  end

  def get_k_n_student_short_list(k, n)
    rows = @db.execute("SELECT id, name FROM students ORDER BY id LIMIT #{n} OFFSET #{(k-1)*n}")
    data_list = Data_list.new
    rows.each do |row|
      student_short = Student_short.new(row[0], row[1])
      data_list.add(student_short)
    end
    data_list
  end

  def add_student(student)
    id_count = @db.execute("SELECT id from students")
    id = id_count.length + 1
    @db.execute("INSERT INTO students (id, name, age, telegram) VALUES (?, ?, ?, ?)", id, student.name, student.age, student.telegram)
    student.id = id
  end

  def replace_student(student)
    @db.execute("UPDATE students SET name = ?, age = ?, telegram = ? WHERE id = ?", student.name, student.age, student.telegram, student.id)
  end

  def delete_student(id)
    @db.execute("DELETE FROM students WHERE id = ?", id)
  end

  def count_students
    row = @db.get_first_row("SELECT COUNT(*) FROM students")
    return row[0]
  end
end

class Student_short
  attr_accessor :id, :name

  def initialize(id, name)
    @id = id
    @name = name
  end
end

class Data_list
  attr_accessor :list

  def initialize(list = [])
    @list = list
  end

  def add(student_short)
    @list << student_short
  end
end