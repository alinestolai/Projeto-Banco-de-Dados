/*Projeto de Banco de Dados

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
    capacity FLOAT,
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
  total_cred INT
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
  PRIMARY KEY(coruse_id, prereq_id)
);

-- tabela para o sumário do departamento
CREATE TABLE department_summary (
    dept_name TEXT PRIMARY KEY,
    budget FLOAT,
    total_students INT,
    total_salary FLOAT
);




















  
