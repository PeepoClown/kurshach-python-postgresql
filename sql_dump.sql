--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campus; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.campus (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    adress character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    workstart time without time zone NOT NULL,
    workend time without time zone NOT NULL
);


ALTER TABLE public.campus OWNER TO dmitriy;

--
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.campus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.campus_id_seq OWNER TO dmitriy;

--
-- Name: campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.campus_id_seq OWNED BY public.campus.id;


--
-- Name: cathedra; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.cathedra (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    faculty_id integer NOT NULL,
    campus_id integer NOT NULL,
    chief_id integer NOT NULL
);


ALTER TABLE public.cathedra OWNER TO dmitriy;

--
-- Name: cathedra_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.cathedra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cathedra_id_seq OWNER TO dmitriy;

--
-- Name: cathedra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.cathedra_id_seq OWNED BY public.cathedra.id;


--
-- Name: classroom; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.classroom (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    campus_id integer NOT NULL
);


ALTER TABLE public.classroom OWNER TO dmitriy;

--
-- Name: classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classroom_id_seq OWNER TO dmitriy;

--
-- Name: classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.classroom_id_seq OWNED BY public.classroom.id;


--
-- Name: classtime; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.classtime (
    id integer NOT NULL,
    starttime time without time zone NOT NULL,
    endtime time without time zone NOT NULL
);


ALTER TABLE public.classtime OWNER TO dmitriy;

--
-- Name: classtime_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.classtime_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classtime_id_seq OWNER TO dmitriy;

--
-- Name: classtime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.classtime_id_seq OWNED BY public.classtime.id;


--
-- Name: faculty; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.faculty (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    chief_id integer NOT NULL,
    campus_id integer NOT NULL
);


ALTER TABLE public.faculty OWNER TO dmitriy;

--
-- Name: faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculty_id_seq OWNER TO dmitriy;

--
-- Name: faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.faculty_id_seq OWNED BY public.faculty.id;


--
-- Name: group; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public."group" (
    id integer NOT NULL,
    cipher character varying(50) NOT NULL,
    course integer NOT NULL,
    studentscount integer NOT NULL,
    cathedra_id integer NOT NULL,
    specialty_id integer NOT NULL
);


ALTER TABLE public."group" OWNER TO dmitriy;

--
-- Name: group_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_id_seq OWNER TO dmitriy;

--
-- Name: group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.group_id_seq OWNED BY public."group".id;


--
-- Name: specialty; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.specialty (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    cipher character varying(10) NOT NULL
);


ALTER TABLE public.specialty OWNER TO dmitriy;

--
-- Name: specialty_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.specialty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.specialty_id_seq OWNER TO dmitriy;

--
-- Name: specialty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.specialty_id_seq OWNED BY public.specialty.id;


--
-- Name: subject; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.subject OWNER TO dmitriy;

--
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_id_seq OWNER TO dmitriy;

--
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;


--
-- Name: teacher; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.teacher (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    phone character varying(20) NOT NULL,
    email character varying(50) NOT NULL,
    cathedra_id integer NOT NULL,
    teacherprofile_id integer NOT NULL
);


ALTER TABLE public.teacher OWNER TO dmitriy;

--
-- Name: teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacher_id_seq OWNER TO dmitriy;

--
-- Name: teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.teacher_id_seq OWNED BY public.teacher.id;


--
-- Name: teacherprofile; Type: TABLE; Schema: public; Owner: dmitriy
--

CREATE TABLE public.teacherprofile (
    id integer NOT NULL,
    rank character varying(50),
    grade character varying(50),
    "position" character varying(50) NOT NULL,
    education character varying(50) NOT NULL
);


ALTER TABLE public.teacherprofile OWNER TO dmitriy;

--
-- Name: teacherprofile_id_seq; Type: SEQUENCE; Schema: public; Owner: dmitriy
--

CREATE SEQUENCE public.teacherprofile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teacherprofile_id_seq OWNER TO dmitriy;

--
-- Name: teacherprofile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dmitriy
--

ALTER SEQUENCE public.teacherprofile_id_seq OWNED BY public.teacherprofile.id;


--
-- Name: campus id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.campus ALTER COLUMN id SET DEFAULT nextval('public.campus_id_seq'::regclass);


--
-- Name: cathedra id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.cathedra ALTER COLUMN id SET DEFAULT nextval('public.cathedra_id_seq'::regclass);


--
-- Name: classroom id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.classroom ALTER COLUMN id SET DEFAULT nextval('public.classroom_id_seq'::regclass);


--
-- Name: classtime id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.classtime ALTER COLUMN id SET DEFAULT nextval('public.classtime_id_seq'::regclass);


--
-- Name: faculty id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.faculty ALTER COLUMN id SET DEFAULT nextval('public.faculty_id_seq'::regclass);


--
-- Name: group id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public."group" ALTER COLUMN id SET DEFAULT nextval('public.group_id_seq'::regclass);


--
-- Name: specialty id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.specialty ALTER COLUMN id SET DEFAULT nextval('public.specialty_id_seq'::regclass);


--
-- Name: subject id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);


--
-- Name: teacher id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.teacher ALTER COLUMN id SET DEFAULT nextval('public.teacher_id_seq'::regclass);


--
-- Name: teacherprofile id; Type: DEFAULT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.teacherprofile ALTER COLUMN id SET DEFAULT nextval('public.teacherprofile_id_seq'::regclass);


--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.campus (id, name, adress, phone, workstart, workend) FROM stdin;
1	Кампус на проспекте Вернадского 78	проспект Вернадского, 78	+7 (920) 380-22-11	09:00:00	23:00:00
2	Кампус на улице Стромынка	улица Стромынка, д. 20	+7 (930) 970-22-55	08:00:00	22:45:00
3	Кампус на проспекте Вернадского 86	проспект Вернадского, 86	+7 (920) 845-12-24	09:00:00	23:00:00
4	Кампус на улице Соколиная гора	5-я ул. Соколиной горы, дом 22	+7 (912) 345-90-80	09:00:00	22:30:00
5	Кампус на улице Малая Пироговская	улица Малая Пироговская, д. 1, стр. 5	+7 (955) 555-92-33	09:00:00	21:00:00
\.


--
-- Data for Name: cathedra; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.cathedra (id, name, phone, email, faculty_id, campus_id, chief_id) FROM stdin;
1	Кафедра Высшей Математики	+7 (933) 222-33-44	math@univer.ru	1	1	2
2	Кафедра Физики	+7 (933) 111-22-33	fizika@univer.ru	1	2	5
3	Кафедра Информационных технологий	+7 (933) 333-44-55	it@univer.ru	1	1	6
4	Кафедра Гуманитарных наук	+7 (933) 555-66-77	guman@univer.ru	2	3	8
5	Кафедра Информационной безопасности	+7 (933) 444-55-66	infobez@univer.ru	1	4	10
\.


--
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.classroom (id, name, campus_id) FROM stdin;
1	A-1	1
2	A-2	1
3	A-3	1
4	A-4	1
5	A-5	1
6	A-6	1
7	A-7	1
8	A-8	1
9	Б-132	1
10	Б-240	1
11	В-102	1
12	В-222	1
13	Г-188	1
14	Д-101	1
15	Е-250	1
16	128	2
17	216	2
18	249	2
19	309	2
20	330	2
21	426	2
22	451	2
23	К-1	3
24	К-2	3
25	У-112	3
26	У-200	3
27	Т-31	4
28	Т-23	4
29	22	5
30	18	5
\.


--
-- Data for Name: classtime; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.classtime (id, starttime, endtime) FROM stdin;
1	09:00:00	10:30:00
2	10:40:00	12:10:00
3	12:40:00	14:10:00
4	14:20:00	15:50:00
5	16:20:00	17:50:00
6	18:00:00	19:30:00
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.faculty (id, name, phone, email, chief_id, campus_id) FROM stdin;
1	Технический	+7 (922) 390-15-69	fizmat@univer.ru	2	1
2	Гуманитарный	+7 (922) 401-26-70	gum@univer.ru	8	3
\.


--
-- Data for Name: group; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public."group" (id, cipher, course, studentscount, cathedra_id, specialty_id) FROM stdin;
1	БСБО-01	3	30	3	5
2	БСБО-02	1	32	3	5
3	ККК-01	4	21	2	4
4	ФИБО-01	1	35	2	3
5	МЕХА-01	1	31	1	2
6	МАТАН-01	1	32	1	1
7	ИТТО-01	1	30	3	6
8	ИТТО-01	3	25	3	6
9	ФИЛО-01	2	33	4	7
10	ИНФБ-01	4	23	5	8
11	МАТАН-01	2	29	1	1
12	КЕК-00	5	19	3	5
\.


--
-- Data for Name: specialty; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.specialty (id, name, cipher) FROM stdin;
1	Прикладная математика	1
2	Математика и механика	5
3	Прикладная физика	2
4	Астрономия	3
5	Прикладная информатика	4
6	Программная инженерия	6
7	Филология	7
8	Информационная безопасность	8
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.subject (id, name) FROM stdin;
1	Математический анализ
2	Линейная алгебра
3	Аналитическая геометрия
4	Языки программирования
5	Компьютерные сети
6	Базы данных
7	Философия
8	История
9	Операционные системы
\.


--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.teacher (id, name, age, phone, email, cathedra_id, teacherprofile_id) FROM stdin;
1	Волков Георгий Ильич	51	+7 (911) 123-34-45	volkov@univer.ru	1	6
2	Баранова Анна Егоровна	65	+7 (911) 567-78-89	baranova@univer.ru	1	5
3	Кондратьева Злата Глебовна	26	+7 (911) 912-23-34	kondrateva@univer.ru	1	7
4	Ефремов Марк Даниилович	28	+7 (911) 456-67-78	efremov@univer.ru	1	2
5	Миронов Владимир Фёдорович	48	+7 (912) 123-34-45	mironov@univer.ru	2	8
6	Яковлев Герман Иванович	51	+7 (913) 123-34-45	yakovlev@univer.ru	3	8
7	Савельева Мила Максимовна	32	+7 (913) 567-78-89	saveleva@univer.ru	3	1
8	Леонова Алиса Николаевна	45	+7 (914) 123-34-45	leonova@univer.ru	4	4
9	Аксенов Платон Тимофеевич	31	+7 (914) 567-78-89	aksenov@univer.ru	4	3
10	Борисов Александр Владимирович	36	+7 (915) 123-34-45	borisov@univer.ru	5	5
\.


--
-- Data for Name: teacherprofile; Type: TABLE DATA; Schema: public; Owner: dmitriy
--

COPY public.teacherprofile (id, rank, grade, "position", education) FROM stdin;
1	Кандидат наук	Доцент	Преподаватель	Высшее физ-мат
2	Кандидат наук	Старший преподаватель	Преподаватель	Высшее физ-мат
3	Кандидат наук	Доцент	Преподаватель	Высшее филологическое
4	Доктор наук	Профессор	Зав. кафедрой	Высшее филологическое
5	Доктор наук	Профессор	Зав. кафедрой	Высшее физ-мат
6	Доктор наук	Профессор	Преподаватель	Высшее физ-мат
7	\N	\N	Преподаватель	Высшее физ-мат
8	Кандидат наук	Доцент	Зав. кафедрой	Высшее физ-мат
\.


--
-- Name: campus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.campus_id_seq', 5, true);


--
-- Name: cathedra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.cathedra_id_seq', 5, true);


--
-- Name: classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.classroom_id_seq', 31, true);


--
-- Name: classtime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.classtime_id_seq', 6, true);


--
-- Name: faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.faculty_id_seq', 2, true);


--
-- Name: group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.group_id_seq', 12, true);


--
-- Name: specialty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.specialty_id_seq', 8, true);


--
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.subject_id_seq', 9, true);


--
-- Name: teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.teacher_id_seq', 10, true);


--
-- Name: teacherprofile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dmitriy
--

SELECT pg_catalog.setval('public.teacherprofile_id_seq', 8, true);


--
-- Name: campus pk_campus; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT pk_campus PRIMARY KEY (id);


--
-- Name: cathedra pk_cathedra; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.cathedra
    ADD CONSTRAINT pk_cathedra PRIMARY KEY (id);


--
-- Name: classtime pk_class; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.classtime
    ADD CONSTRAINT pk_class PRIMARY KEY (id);


--
-- Name: classroom pk_classroom; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT pk_classroom PRIMARY KEY (id);


--
-- Name: faculty pk_faculty; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT pk_faculty PRIMARY KEY (id);


--
-- Name: group pk_group; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT pk_group PRIMARY KEY (id);


--
-- Name: specialty pk_specialty; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.specialty
    ADD CONSTRAINT pk_specialty PRIMARY KEY (id);


--
-- Name: subject pk_subject; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT pk_subject PRIMARY KEY (id);


--
-- Name: teacher pk_teacher; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT pk_teacher PRIMARY KEY (id);


--
-- Name: teacherprofile pk_teacherprofile; Type: CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.teacherprofile
    ADD CONSTRAINT pk_teacherprofile PRIMARY KEY (id);


--
-- Name: campus_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX campus_idindex ON public.campus USING btree (id);


--
-- Name: cathedra_fkidcampusindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX cathedra_fkidcampusindex ON public.cathedra USING btree (campus_id);


--
-- Name: cathedra_fkidfacultyindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX cathedra_fkidfacultyindex ON public.cathedra USING btree (faculty_id);


--
-- Name: cathedra_fkidteacherindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX cathedra_fkidteacherindex ON public.cathedra USING btree (chief_id);


--
-- Name: cathedra_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX cathedra_idindex ON public.cathedra USING btree (id);


--
-- Name: classroom_fkidcampusindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX classroom_fkidcampusindex ON public.classroom USING btree (campus_id);


--
-- Name: classroom_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX classroom_idindex ON public.classroom USING btree (id);


--
-- Name: classtime_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX classtime_idindex ON public.classtime USING btree (id);


--
-- Name: faculty_fkidcampusindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX faculty_fkidcampusindex ON public.faculty USING btree (campus_id);


--
-- Name: faculty_fkidteacherindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX faculty_fkidteacherindex ON public.faculty USING btree (chief_id);


--
-- Name: faculty_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX faculty_idindex ON public.faculty USING btree (id);


--
-- Name: group_fkidcathedraindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX group_fkidcathedraindex ON public."group" USING btree (cathedra_id);


--
-- Name: group_fkidspecialtyindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX group_fkidspecialtyindex ON public."group" USING btree (specialty_id);


--
-- Name: group_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX group_idindex ON public."group" USING btree (id);


--
-- Name: specialty_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX specialty_idindex ON public.specialty USING btree (id);


--
-- Name: subject_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX subject_idindex ON public.subject USING btree (id);


--
-- Name: teacher_fkidcathedraindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX teacher_fkidcathedraindex ON public.teacher USING btree (cathedra_id);


--
-- Name: teacher_fkidteacherprofileindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX teacher_fkidteacherprofileindex ON public.teacher USING btree (teacherprofile_id);


--
-- Name: teacher_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX teacher_idindex ON public.teacher USING btree (id);


--
-- Name: teacherprofile_idindex; Type: INDEX; Schema: public; Owner: dmitriy
--

CREATE INDEX teacherprofile_idindex ON public.teacherprofile USING btree (id);


--
-- Name: cathedra fk_campustocathedra; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.cathedra
    ADD CONSTRAINT fk_campustocathedra FOREIGN KEY (campus_id) REFERENCES public.campus(id);


--
-- Name: classroom fk_campustoclassroom; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT fk_campustoclassroom FOREIGN KEY (campus_id) REFERENCES public.campus(id);


--
-- Name: faculty fk_campustofaculty; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT fk_campustofaculty FOREIGN KEY (campus_id) REFERENCES public.campus(id);


--
-- Name: teacher fk_cathedratoteacher; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT fk_cathedratoteacher FOREIGN KEY (cathedra_id) REFERENCES public.cathedra(id);


--
-- Name: cathedra fk_facultytocathedra; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.cathedra
    ADD CONSTRAINT fk_facultytocathedra FOREIGN KEY (faculty_id) REFERENCES public.faculty(id);


--
-- Name: group fk_grouptocathedra; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT fk_grouptocathedra FOREIGN KEY (cathedra_id) REFERENCES public.cathedra(id);


--
-- Name: group fk_grouptospecialty; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public."group"
    ADD CONSTRAINT fk_grouptospecialty FOREIGN KEY (specialty_id) REFERENCES public.specialty(id);


--
-- Name: teacher fk_teacherprofiletoteacher; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT fk_teacherprofiletoteacher FOREIGN KEY (teacherprofile_id) REFERENCES public.teacherprofile(id);


--
-- Name: cathedra fk_teachertocathedra; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.cathedra
    ADD CONSTRAINT fk_teachertocathedra FOREIGN KEY (chief_id) REFERENCES public.teacher(id);


--
-- Name: faculty fk_teachertofaculty; Type: FK CONSTRAINT; Schema: public; Owner: dmitriy
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT fk_teachertofaculty FOREIGN KEY (chief_id) REFERENCES public.teacher(id);


--
-- Name: TABLE campus; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.campus TO admin;
GRANT SELECT ON TABLE public.campus TO usr;


--
-- Name: TABLE cathedra; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.cathedra TO admin;
GRANT SELECT ON TABLE public.cathedra TO usr;


--
-- Name: TABLE classroom; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.classroom TO admin;
GRANT SELECT ON TABLE public.classroom TO usr;


--
-- Name: TABLE classtime; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.classtime TO admin;
GRANT SELECT ON TABLE public.classtime TO usr;


--
-- Name: TABLE faculty; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.faculty TO admin;
GRANT SELECT ON TABLE public.faculty TO usr;


--
-- Name: TABLE "group"; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public."group" TO admin;
GRANT SELECT ON TABLE public."group" TO usr;


--
-- Name: TABLE specialty; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.specialty TO admin;
GRANT SELECT ON TABLE public.specialty TO usr;


--
-- Name: TABLE subject; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.subject TO admin;
GRANT SELECT ON TABLE public.subject TO usr;


--
-- Name: TABLE teacher; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.teacher TO admin;
GRANT SELECT ON TABLE public.teacher TO usr;


--
-- Name: TABLE teacherprofile; Type: ACL; Schema: public; Owner: dmitriy
--

GRANT ALL ON TABLE public.teacherprofile TO admin;
GRANT SELECT ON TABLE public.teacherprofile TO usr;


--
-- PostgreSQL database dump complete
--

