require 'sqlite3'

db = SQLite3::Database.new 'students_db.db'

db.execute <<-SQL
INSERT INTO student(last_name, first_name, second_name, git)
VALUES ('Fam', 'Name', 'Pat','@qwerty'),
('Hikka', 'Ruby', 'Patter','@qwcom'),
('Cent', 'Camel', 'Cucumber','@009009090'),
('Durov', 'Rustam', 'Pavlovich','@deltanull'),
('Chushka', 'Mouse', 'Pole','@polevka228'),
('Famik', 'Namik', 'Patik','@qytik');
SQL