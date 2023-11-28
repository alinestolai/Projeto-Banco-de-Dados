/*Projeto de Banco de Dados
Aline Stolai 22.121.003-2
Gabriel Lopez Vendramini 22.121.015-6
João Lucas F.A Rocha 22.121.004-0

Escolhemos o banco wide-colum storage para realizarmos as queries. */

-- criando um keyspace no Cassandra chamado university
CREATE KEYSPACE university
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

-- para usar o keyspace
USE university;

-- criamos uma tabela para as salas da universidade
CREATE TABLE classroom (
    building TEXT,
    room_number TEXT,
    capacity TEXT,
    PRIMARY KEY (building, room_number)
);

-- tabela para os departamentos da universidade
CREATE TABLE department (
	dept_name TEXT PRIMARY KEY,
	building TEXT,
	budget FLOAT
);

-- tabela para os cursos da universidade
CREATE TABLE course (
	course_id TEXT PRIMARY KEY,
	title TEXT,
	dept_name TEXT,
	credits INT
);

-- tabela para os instrutores da universidade
CREATE TABLE instructor (
	ID TEXT PRIMARY KEY,
	name TEXT,
	dept_name TEXT,
	salary FLOAT
); 

-- tabela para as sessões da universidade
CREATE TABLE section (
	course_id TEXT,
	sec_id TEXT,
	semester TEXT,
	year INT,
  	building TEXT,
  	room_number TEXT,
  	time_slot_id TEXT,
  	PRIMARY KEY(course_id, sec_id, semester, year)
);

-- tabela para as aulas da universidade
CREATE TABLE teaches (
  ID TEXT,
  course_id TEXT,
  sec_id TEXT,
  semester TEXT,
  year INT,
  PRIMARY KEY(ID, course_id, sec_id, semester, year)
);

-- tabela para os alunos da universidade
CREATE TABLE student(
  ID TEXT PRIMARY KEY,
  name TEXT,
  dept_name TEXT,
  tot_cred INT
);

-- tabela para as aulas dos alunos da universidade
CREATE TABLE takes(
  ID TEXT,
  course_id TEXT,
  sec_id TEXT,
  semester TEXT,
  year INT,
  grade TEXT,
  PRIMARY KEY(ID, course_id, sec_id, semester, year)
);

-- tabela para o conselheiro da universidade
CREATE TABLE advisor(
  s_ID TEXT PRIMARY KEY,
  i_ID TEXT
);

-- tabela para o time slot
CREATE TABLE time_slot(
  time_slot_id TEXT,
  day TEXT,
  start_hr INT,
  start_min INT,
  end_hr INT,
  end_min INT,
  PRIMARY KEY(time_slot_id, day, start_hr, start_min) 
);

-- tabela para o prereq
CREATE TABLE prereq(
  course_id TEXT,
  prereq_id TEXT,
  PRIMARY KEY(course_id, prereq_id)
);

-- tabela para o sumário do departamento
CREATE TABLE department_summary (
    dept_name TEXT PRIMARY KEY,
    budget FLOAT,
    total_students INT,
    total_salary FLOAT
);

-- criando uma tabela para a primeira consulta
CREATE TABLE query_um (
	ID TEXT,
	name TEXT,
	title TEXT,
	course_id TEXT,
	sec_id TEXT,
	s_ID TEXT,
	i_ID TEXT,
	PRIMARY KEY(ID, s_ID, i_ID)
);

-- criando uma tabela para a segunda consulta
CREATE TABLE query_dois (
	name TEXT,
	room_number TEXT,
	building TEXT,
	dept_name TEXT,
	PRIMARY KEY (room_number, building, dept_name)
);

-- criando tabela para a terceira consulta
CREATE TABLE query_tres (
	ID TEXT PRIMARY KEY,
	dept_name TEXT,
	budget FLOAT,
	salary FLOAT
);
	
	
/*Como são muitos inserts, colocamos apenas alguns de cada tabela para mostrar como fizemos.*/

--insert para classroom
INSERT INTO classroom(building, room_number, capacity) VALUES ('Painter', '514', '10');
INSERT INTO classroom(building, room_number, capacity) VALUES ('Taylor', '3128', '70');
INSERT INTO classroom(building, room_number, capacity) VALUES ('Watson', '100', '30');

-- insert para department
INSERT INTO department (dept_name, building, budget) VALUES ('Civil Eng.', 'Chandler', 255041.46);
INSERT INTO department (dept_name, building, budget) VALUES ('Biology', 'Candlestick', 647610.55);
INSERT INTO department (dept_name, building, budget) VALUES ('History', 'Taylor', 699140.86);

-- insert para instructor
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('63395', 'McKinnon', 'Cybernetics', 94333.99);
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('78699', 'Pingr', 'Statistics', 59303.62);
INSERT INTO instructor (ID, name, dept_name, salary) VALUES ('96895', 'Mird', 'Marketing', 119921.41);

-- insert para student
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES ('24746', 'Schrefl', 'History', 4);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES ('79352', 'Rumat', 'Finance', 100);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES ('76672', 'Miliko', 'Statistics', 116);

-- insert para course
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('787', 'C  Programming', 'Mech. Eng.', 4);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('238', 'The Music of Donovan', 'Mech. Eng.', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('608', 'Electron Microscopy', 'Mech. Eng.', 3);

-- insert para time_slot
INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) VALUES  ('A', 'M', 8, 0, 8, 50);
INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) VALUES  ('A', 'M', 8, 0, 8, 50);
INSERT INTO time_slot (time_slot_id, day, start_hr, start_min, end_hr, end_min) VALUES  ('A', 'W', 8, 0, 8, 50);

-- insert para teaches 
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES ('34175', '747', '1', 'Spring', 2004);
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES ('3199', '169', '1', 'Spring', 2007);
INSERT INTO teaches (ID, course_id, sec_id, semester, year) VALUES ('6569', '445', '1', 'Spring', 2001);

-- insert para takes
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES ('65901', '401', '1', 'Fall', 2003, 'C-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES ('24932', '802', '1', 'Spring', 2003, 'B-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES ('61332', '200', '1', 'Spring', 2007, 'A-');

-- insert para advisor
INSERT INTO advisor (s_ID, i_ID) VALUES ('24746', '19368');
INSERT INTO advisor (s_ID, i_ID) VALUES ('79352', '95030');
INSERT INTO advisor (s_ID, i_ID) VALUES ('76672', '22591');

-- insert para coluna da primeira consulta

















  
