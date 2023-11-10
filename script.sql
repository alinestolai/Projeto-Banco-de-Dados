CREATE KEYSPACE university
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE university;

CREATE TABLE classroom (
    building TEXT,
    room_number TEXT,
    capacity FLOAT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
	dept_name TEXT PRIMARY KEY,
	building TEXT,
	budget FLOAT
);

CREATE TABLE course (
	course_id TEXT PRIMARY KEY,
	title TEXT,
	dept_name TEXT,
	credits INT
);

CREATE TABLE instructor (
	ID TEXT PRIMARY KEY,
	name TEXT,
	dept_name TEXT,
	salary FLOAT
); 

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

CREATE TABLE teaches (
  ID TEXT,
  course_id TEXT,
  sec_id TEXT,
  semester TEXT,
  year INT,
  PRIMARY KEY(ID, course_id, sec_id, semester, year)
);

CREATE TABLE student(
  ID TEXT PRIMARY KEY,
  name TEXT,
  dept_name TEXT,
  total_cred INT
);

CREATE TABLE takes(
  ID TEXT,
  course_id TEXT,
  sec_id TEXT,
  semester TEXT,
  year INT,
  grade TEXT,
  PRIMARY KEY(ID, course_id, sec_id, semester, year)
);

CREATE TABLE advisor(
  s_ID TEXT PRIMARY KEY,
  i_ID TEXT
);

CREATE TABLE time_slot(
  time_slot_id TEXT,
  day TEXT,
  start_hr INT,
  start_min INT,
  end_hr INT,
  end_min INT,
  PRIMARY KEY(time_slot_id, day, start_hr, start_min) 
);

CREATE TABLE prereq(
  course_id TEXT,
  prereq_id TEXT,
  PRIMARY KEY(coruse_id, prereq_id)
);

CREATE TABLE department_summary (
    dept_name TEXT PRIMARY KEY,
    budget FLOAT,
    total_students INT,
    total_salary FLOAT
);




















  
