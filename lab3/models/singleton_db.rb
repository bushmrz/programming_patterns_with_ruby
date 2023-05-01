require 'sqlite3'

class Singleton_students_DB
  DB_NAME = 'students_db.db'.freeze

  @instance = nil

  def self.instance
    @instance ||= new
  end

  def initialize
    @db = SQLite3::Database.new(DB_NAME)
  end

  def delete_student(id)
    @db.execute("DELETE FROM students WHERE id = ?", id)
  end

  def count_students
    row = @db.get_first_row("SELECT COUNT(*) FROM students")
    row[0]
  end
end