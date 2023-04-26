class Student
  attr_accessor :id, :name, :age, :telegram

  # конструктор
  def initialize(args)
    @name = args[:name]
    @age = args[:age]
    @id = args[:id]
    @telegram = args[:telegram]
  end

  def self.create_table(db)
    db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS students(
                        id integer primary key,
                        name varchar(50) not null,
                        age integer,
                        telegram varchar(50)
);
    SQL
  end

  def self.seed(db)
    db.execute <<-SQL
      INSERT INTO students (name, age, telegram) VALUES
        ('Kentin', 25, '@bidengo'),
        ('Tonny', 18, '@qwerty'),
        ('Oliver', 20, '@oli228');
    SQL
  end

end