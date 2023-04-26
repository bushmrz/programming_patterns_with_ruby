require 'sqlite3'

db = SQLite3::Database.new 'students_db.db'

db.execute <<-SQL
    create table student(
                        id integer unique not null primary key,
                        last_name varchar(50) not null,
                        first_name varchar(50) not null,
                        second_name varchar(50) not null,
                        git varchar(50),
                        phone varchar(12),
                        telegram varchar(50),
                        mail varchar(50)
);
SQL


