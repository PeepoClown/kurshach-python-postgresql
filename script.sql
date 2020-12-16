CREATE DATABASE scheduler; -- create db

CREATE USER dmitriy WITH PASSWORD '12345' SUPERUSER CREATEDB; -- admin
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO dmitriy;
CREATE USER sampleuser; -- sample user
GRANT SELECT ON ALL TABLES IN SCHEMA public TO sampleuser;

-- campus table
CREATE TABLE public.campus
(
	id				serial		NOT NULL,
	name			varchar(50)	NOT NULL,
	adress			varchar(50)	NOT NULL,
	phone			varchar(20)	NOT NULL,
	workStart		time		NOT NULL,
	workEnd			time		NOT NULL,
	CONSTRAINT PK_campus PRIMARY KEY (id)
);
-- insert data to campus table
INSERT INTO public.campus (name, adress, phone, workStart, workEnd) VALUES
	('Кампус на проспекте Вернадского 78', 'проспект Вернадского, 78', '+7 (920) 380-22-11', '09:00', '23:00'),
	('Кампус на улице Стромынка', 'улица Стромынка, д. 20', '+7 (930) 970-22-55', '08:00', '22:45'),
	('Кампус на проспекте Вернадского 86', 'проспект Вернадского, 86', '+7 (920) 845-12-24', '09:00', '23:00'),
	('Кампус на улице Соколиная гора', '5-я ул. Соколиной горы, дом 22', '+7 (912) 345-90-80', '09:00', '22:30'),
	('Кампус на улице Малая Пироговская', 'улица Малая Пироговская, д. 1, стр. 5', '+7 (955) 555-92-33', '09:00', '21:00');
-- create index by id field of campus table
CREATE INDEX campus_idIndex ON public.campus (id);

-- classroom table
CREATE TABLE public.classroom
(
	id			serial		NOT NULL,
	name		varchar(50)	NOT NULL,
	campus_id	integer		NOT NULL,
	CONSTRAINT PK_classroom PRIMARY KEY (id),
	CONSTRAINT FK_campusToClassroom FOREIGN KEY (campus_id) REFERENCES public.campus (id)
);
-- insert data to classroom table
INSERT INTO public.classroom (name, campus_id) VALUES
	('A-1', 1), ('A-2', 1), ('A-3', 1), ('A-4', 1), ('A-5', 1),
	('A-6', 1), ('A-7', 1), ('A-8', 1), ('Б-132', 1), ('Б-240', 1),
	('В-102', 1), ('В-222', 1), ('Г-188', 1), ('Д-101', 1), ('Е-250', 1),
	('128', 2), ('216', 2), ('249', 2), ('309', 2), ('330', 2),
	('426', 2), ('451', 2), ('К-1', 3), ('К-2', 3), ('У-112', 3),
	('У-200', 3), ('Т-31', 4), ('Т-23', 4), ('22', 5), ('18', 5);
-- create index by, id field, and FK to campus table, of classroom table
CREATE INDEX classroom_idIndex ON public.classroom (id);
CREATE INDEX classroom_FKIdCampusIndex ON public.classroom (campus_id);

-- subject table
CREATE TABLE public.subject
(
	id		serial			NOT NULL,
	name	varchar(100)	NOT NULL,
	CONSTRAINT PK_subject PRIMARY KEY (id)
);
-- insert data to subject table
INSERT INTO public.subject (name) VALUES
	('Математический анализ'), ('Линейная алгебра'), ('Аналитическая геометрия'),
	('Языки программирования'), ('Компьютерные сети'), ('Базы данных'),
	('Философия'), ('История'), ('Операционные системы');
-- create index by id field of subject table
CREATE INDEX subject_idIndex ON public.subject (id);

-- classTime table
CREATE TABLE public.classTime
(
	id			serial	NOT NULL,
	startTime	time	NOT NULL,
	endTime		time	NOT NULL,
	CONSTRAINT PK_class PRIMARY KEY (id)
);
-- insert data to classTime table
INSERT INTO public.classTime (startTime, endTime) VALUES
	('09:00', '10:30'), ('10:40', '12:10'), ('12:40', '14:10'),
	('14:20', '15:50'), ('16:20', '17:50'), ('18:00', '19:30');
-- create index by id field of classTime table
CREATE INDEX classTime_idIndex ON public.classTime (id);

-- faculty table
CREATE TABLE public.faculty
(
	id			serial		NOT NULL,
	name		varchar(50)	NOT NULL,
	phone		varchar(20)	NOT NULL,
	email		varchar(50)	NOT NULL,
	chief_id	integer		NOT NULL,
	campus_id	integer		NOT NULL,
	CONSTRAINT PK_faculty PRIMARY KEY (id),
	CONSTRAINT FK_campusToFaculty FOREIGN KEY (campus_id) REFERENCES public.campus (id)
);
-- insert data to faculty table - later
-- create index by, id field, and FK to campus table, of faculty table
CREATE INDEX faculty_idIndex ON public.faculty (id);
CREATE INDEX faculty_FKIdCampusIndex ON public.faculty (campus_id);
CREATE INDEX faculty_FKIdTeacherIndex ON public.faculty (chief_id);

-- cathedra table
CREATE TABLE public.cathedra
(
	id			serial		NOT NULL,
	name		varchar(50)	NOT NULL,
	phone		varchar(20)	NOT NULL,
	email		varchar(50)	NOT NULL,
	faculty_id	integer		NOT NULL,
	campus_id	integer		NOT NULL,
	chief_id	integer		NOT NULL,
	CONSTRAINT PK_cathedra PRIMARY KEY (id),
	CONSTRAINT FK_facultyToCathedra FOREIGN KEY (faculty_id) REFERENCES public.faculty (id),
	CONSTRAINT FK_campusToCathedra FOREIGN KEY (campus_id) REFERENCES public.campus (id)
);
-- insert data to cathedra table - later
-- create index by, id field, FK to campus table and FK to faculty table and teacher table, of cathedra table
CREATE INDEX cathedra_idIndex ON public.cathedra (id);
CREATE INDEX cathedra_FKIdFacultyIndex ON public.cathedra (faculty_id);
CREATE INDEX cathedra_FKIdCampusIndex ON public.cathedra (campus_id);
CREATE INDEX cathedra_FKIdTeacherIndex ON public.cathedra (chief_id);

-- teacherProfile table
CREATE TABLE public.teacherProfile
(
	id			serial		NOT NULL,
	rank		varchar(50)	NULL,
	grade		varchar(50)	NULL,
	position	varchar(50)	NOT NULL,
	education	varchar(50)	NOT NULL,
	CONSTRAINT PK_teacherprofile PRIMARY KEY (id)
);
-- insert data to teacherProfile table
INSERT INTO public.teacherProfile (rank, grade, position, education) VALUES
	('Кандидат наук', 'Доцент', 'Преподаватель', 'Высшее физ-мат'),
	('Кандидат наук', 'Старший преподаватель', 'Преподаватель', 'Высшее физ-мат'),
	('Кандидат наук', 'Доцент', 'Преподаватель', 'Высшее филологическое'),
	('Доктор наук', 'Профессор', 'Зав. кафедрой', 'Высшее филологическое'),
	('Доктор наук', 'Профессор', 'Зав. кафедрой', 'Высшее физ-мат'),
	('Доктор наук', 'Профессор', 'Преподаватель', 'Высшее физ-мат'),
	(NULL, NULL, 'Преподаватель', 'Высшее физ-мат'),
	('Кандидат наук', 'Доцент', 'Зав. кафедрой', 'Высшее физ-мат');
-- create index by id field of teacherProfile table
CREATE INDEX teacherProfile_idIndex ON public.teacherProfile (id);

-- teacher table
CREATE TABLE public.teacher
(
	id					serial		NOT NULL,
	name				varchar(50)	NOT NULL,
	age					integer		NOT NULL,
	phone				varchar(20)	NOT NULL,
	email				varchar(50)	NOT NULL,
	cathedra_id			integer		NOT NULL,
	teacherProfile_id	integer		NOT NULL,
	CONSTRAINT PK_teacher PRIMARY KEY (id),
	CONSTRAINT FK_teacherProfileToTeacher FOREIGN KEY (teacherProfile_id) REFERENCES public.teacherProfile (id)
);
-- insert data to teacher table
INSERT INTO public.teacher (name, age, phone, email, cathedra_id, teacherProfile_id) VALUES
	('Волков Георгий Ильич', 51, '+7 (911) 123-34-45', 'volkov@univer.ru', 1, 6),
	('Баранова Анна Егоровна', 65, '+7 (911) 567-78-89', 'baranova@univer.ru', 1, 5),
	('Кондратьева Злата Глебовна', 26, '+7 (911) 912-23-34', 'kondrateva@univer.ru', 1, 7),
	('Ефремов Марк Даниилович', 28, '+7 (911) 456-67-78', 'efremov@univer.ru', 1, 2),
	('Миронов Владимир Фёдорович', 48, '+7 (912) 123-34-45', 'mironov@univer.ru', 2, 8),
	('Яковлев Герман Иванович', 51, '+7 (913) 123-34-45', 'yakovlev@univer.ru', 3, 8),
	('Савельева Мила Максимовна', 32, '+7 (913) 567-78-89', 'saveleva@univer.ru', 3, 1),
	('Леонова Алиса Николаевна', 45, '+7 (914) 123-34-45', 'leonova@univer.ru', 4, 4),
	('Аксенов Платон Тимофеевич', 31, '+7 (914) 567-78-89', 'aksenov@univer.ru', 4, 3),
	('Борисов Александр Владимирович', 36, '+7 (915) 123-34-45', 'borisov@univer.ru', 5, 5);
-- create index by id field of teacherProfile table
CREATE INDEX teacher_idIndex ON public.teacher (id);
CREATE INDEX teacher_FKIdCathedraIndex ON public.teacher (cathedra_id);
CREATE INDEX teacher_FKIdTeacherProfileIndex ON public.teacher (teacherProfile_id);

-- set field of table faculty - chief_id as FK
ALTER TABLE public.faculty ADD CONSTRAINT FK_teacherToFaculty FOREIGN KEY (chief_id) REFERENCES public.teacher (id);
-- insert data to faculty table
INSERT INTO public.faculty (name, phone, email, chief_id, campus_id) VALUES
	('Технический', '+7 (922) 390-15-69', 'fizmat@univer.ru', 2, 1),
	('Гуманитарный', '+7 (922) 401-26-70', 'gum@univer.ru', 8, 3);

-- set field of table cathedra - chief_id as FK
ALTER TABLE public.cathedra ADD CONSTRAINT FK_teacherToCathedra FOREIGN KEY (chief_id) REFERENCES public.teacher (id);
-- insert data to cathedra table
INSERT INTO public.cathedra (name, phone, email, faculty_id, chief_id, campus_id) VALUES
	('Кафедра Высшей Математики', '+7 (933) 222-33-44', 'math@univer.ru', 1, 2, 1),
	('Кафедра Физики', '+7 (933) 111-22-33', 'fizika@univer.ru', 1, 5, 2),
	('Кафедра Информационных технологий', '+7 (933) 333-44-55', 'it@univer.ru', 1, 6, 1),
	('Кафедра Гуманитарных наук', '+7 (933) 555-66-77', 'guman@univer.ru', 2, 8, 3),
	('Кафедра Информационной безопасности', '+7 (933) 444-55-66', 'infobez@univer.ru', 1, 10, 4);

-- set field of table teacher - cathedra_id as FK
ALTER TABLE public.teacher ADD CONSTRAINT FK_cathedraToTeacher FOREIGN KEY (cathedra_id) REFERENCES public.cathedra (id);

-- teacher specialty
CREATE TABLE public.specialty
(
	id		serial		NOT NULL,
	name	varchar(50)	NOT NULL,
	cipher	varchar(10)	NOT NULL,
	CONSTRAINT PK_specialty PRIMARY KEY (id)
);
-- insert data to specialty table
INSERT INTO public.specialty (name, cipher) VALUES
	('Прикладная математика', '1'), ('Математика и механика', '5'),
	('Прикладная физика', '2'), ('Астрономия', '3'),
	('Прикладная информатика', '4'), ('Программная инженерия', '6'),
	('Филология', '7'), ('Информационная безопасность', '8');
-- create index by id field of specialty table
CREATE INDEX specialty_idIndex ON public.specialty (id);

-- group table
CREATE TABLE public.group
(
	id				serial		NOT NULL,
	cipher			varchar(50)	NOT NULL,
	course			integer		NOT NULL,
	studentsCount	integer		NOT NULL,
	cathedra_id		integer		NOT NULL,
	specialty_id	integer		NOT NULL,
	CONSTRAINT PK_group PRIMARY KEY (id),
	CONSTRAINT FK_groupToCathedra FOREIGN KEY (cathedra_id) REFERENCES public.cathedra (id),
	CONSTRAINT FK_groupToSpecialty FOREIGN KEY (specialty_id) REFERENCES public.specialty (id)
);
-- insert data to group table
INSERT INTO public.group (cipher, course, studentsCount, cathedra_id, specialty_id) VALUES
	('БСБО-01', 3, 30, 3, 5), ('БСБО-02', 1, 32, 3, 5),
	('ККК-01', 4, 21, 2, 4), ('ФИБО-01', 1, 35, 2, 3),
	('МЕХА-01', 1, 31, 1, 2), ('МАТАН-01', 1, 32, 1, 1),
	('ИТТО-01', 1, 30, 3, 6), ('ИТТО-01', 3, 25, 3, 6),
	('ФИЛО-01', 2, 33, 4, 7), ('ИНФБ-01', 4, 23, 5, 8),
	('МАТАН-01', 2, 29, 1, 1), ('КЕК-00', 5, 19, 3, 5);
-- create index by id field of group table
CREATE INDEX group_idIndex ON public.group (id);
CREATE INDEX group_FKIdCathedraIndex ON public.group (cathedra_id);
CREATE INDEX group_FKIdSpecialtyIndex ON public.group (specialty_id);

-- table schedule
CREATE TABLE public.schedule
(
	id				serial		NOT NULL,
	subject_id		integer		NOT NULL,
	group_id		integer		NOT NULL,
	teacher_id		integer		NOT NULL,
	classType		varchar(20)	NOT NULL,
	classroom_id	integer		NOT NULL,
	classTime_id	integer		NOT NULL,
	weekDay			varchar(20)	NOT NULL,
	CONSTRAINT PK_schedule PRIMARY KEY (id),
	CONSTRAINT FK_scheduleToSubject FOREIGN KEY (subject_id) REFERENCES public.subject (id),
	CONSTRAINT FK_scheduleToGroup FOREIGN KEY (group_id) REFERENCES public.group (id),
	CONSTRAINT FK_scheduleToTeacher FOREIGN KEY (teacher_id) REFERENCES public.teacher (id),
	CONSTRAINT FK_scheduleToClassroom FOREIGN KEY (classroom_id) REFERENCES public.classroom (id),
	CONSTRAINT FK_scheduleToClassTime FOREIGN KEY (classTime_id) REFERENCES public.classTime (id)
);
-- insert data to schedule table
INSERT INTO public.schedule (subject_id, group_id, teacher_id, classType, classroom_id, classTime_id, weekDay) VALUES

-- create index by id field of schedule table
CREATE INDEX schedule_idIndex ON public.schedule (id);
CREATE INDEX schedule_FKIdSubjectIndex ON public.schedule (subject_id);
CREATE INDEX schedule_FKIdGroupIndex ON public.schedule (group_id);
CREATE INDEX schedule_FKIdTeacherIndex ON public.schedule (teacher_id);
CREATE INDEX schedule_FKIdClassroomIndex ON public.schedule (classroom_id);
CREATE INDEX schedule_FKIdClassTimeIndex ON public.schedule (classTime_id);
