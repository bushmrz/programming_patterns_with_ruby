use studentdb;

delete from student where id;
SELECT t.*
FROM studentdb.student t;

insert into student(last_name, first_name, second_name, git)
            values ('Fam', 'Name', 'Pat','@qwerty');
insert into student(last_name, first_name, second_name, mail)
            values ('Hikka', 'Ruby', 'Patter','qwerty@qw.com');
insert into student(last_name, first_name, second_name, phone)
            values ('Cent', 'Camel', 'Cucumber','+79009009090');
insert into student(last_name, first_name, second_name, telegram)
            values ('Durov', 'Rustam', 'Pavlovich','@deltanull');
insert into student(last_name, first_name, second_name, git, mail, telegram)
            values ('Chushka', 'Mouse', 'Pole','@polevka', 'pole@mail.ru','@polevka228');
insert into student(last_name, first_name, second_name, git, phone, mail)
            values ('Famik', 'Namik', 'Patik','@qytik','+78005553535','soap@soap.uk');

SELECT t.*
FROM studentdb.student t;