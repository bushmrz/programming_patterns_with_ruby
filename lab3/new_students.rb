class Student
  attr_accessor :id, :last_name, :first_name, :second_name,  :mail, :telegram

  # конструктор
  def initialize(args)
    @last_name = args[:last_name]
    @first_name = args[:first_name]
    @second_name = args[:second_name]
    @id = args[:id]
    @mail = args[:mail]
    @telegram = args[:telegram]
  end

  def self.create_table(db)
    db.execute <<-SQL
    CREATE TABLE IF NOT EXISTS student(
                        id integer unique not null primary key,
                        last_name varchar(50) not null,
                        first_name varchar(50) not null,
                        second_name varchar(50) not null,
                        telegram varchar(50),
                        mail varchar(50)
);
    SQL
  end

  def self.seed(db)
    db.execute <<-SQL
      INSERT INTO student (last_name, first_name, second_name) VALUES
        ('Kent', 'John', 'Jo'),
        ('Tons', 'David', 'Deck'),
        ('Rest', 'Oliver', 'Oli');
    SQL
  end

end