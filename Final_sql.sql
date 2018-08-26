-- Создание таблиц

-- 1 таблица персон
CREATE TABLE IF NOT EXISTS person (
    id  INTEGER PRIMARY KEY, 
    first_name VARCHAR(45),
    last_name VARCHAR(45),
    second_name VARCHAR(255),
    e_mail VARCHAR(255) NOT NULL,
    login VARCHAR(45) NOT NULL ,
    password VARCHAR(45) NOT NULL);

-- 2 таблица событий

CREATE TABLE IF NOT EXISTS event_type (
    id  INTEGER PRIMARY KEY, 
    type VARCHAR(45),
    description TEXT );


CREATE TABLE IF NOT EXISTS event (
    id  INTEGER PRIMARY KEY, 
    description TEXT,
    start_date timestamp,
    finish_date timestamp,
    id_creater integer REFERENCES person(id),
    id_type_event integer REFERENCES event_type(id));





-- 3 таблица группы
CREATE TABLE IF NOT EXISTS type_stratum (
    id  INTEGER PRIMARY KEY, 
    type VARCHAR(45),
    description TEXT );


CREATE TABLE IF NOT EXISTS stratum (
    id  INTEGER PRIMARY KEY, 
    name VARCHAR(45) NOT NULL,
    description TEXT,
    id_creater integer REFERENCES person(id),
    ParentId integer REFERENCES stratum(id),
    id_type_stratum integer REFERENCES type_stratum(id));



-- 4 таблица тесты
CREATE TABLE IF NOT EXISTS test (
    id  INTEGER PRIMARY KEY, 
    short_name  VARCHAR(45) NOT NULL,
    description TEXT,
    pass_level_norm integer NOT NULL,
    pass_level_good integer NOT NULL, 
    pass_level_perf integer NOT NULL,
    id_creater integer REFERENCES person(id),
    ParentId integer REFERENCES test (id));

-- 5  таблица вопросы

CREATE TABLE IF NOT EXISTS type_question(
    id  INTEGER PRIMARY KEY, 
    type VARCHAR(45),
    description TEXT );

CREATE TABLE IF NOT EXISTS question (
    id  INTEGER PRIMARY KEY, 
    text TEXT NOT NULL,
    id_creater integer REFERENCES person(id),
    id_type_question  integer REFERENCES type_question(id));


 
-- 6 таблица ответы                                      
CREATE TABLE IF NOT EXISTS answer (
id  INTEGER PRIMARY KEY, 
    text TEXT NOT NULL,
    explanation TEXT,
    correct integer,
    id_creater integer REFERENCES person(id),
    id_question  integer REFERENCES question(id));

-- 7 таблица ответы на вопросы тестов персоны
CREATE TABLE IF NOT EXISTS resault_person (
    value  VARCHAR(45),
    data  timestamp,
    id_event integer REFERENCES event(id),
    id_answer  integer REFERENCES answer(id),
    id_person integer REFERENCES person(id));
-- 8 Таблици связи

CREATE TABLE IF NOT EXISTS event_test (
    id_event  integer REFERENCES event(id),
    id_test integer REFERENCES test(id));

 CREATE TABLE IF NOT EXISTS event_person (
    id_event  integer REFERENCES event(id),
    id_person integer REFERENCES person(id),
    connect_time timestamp);

CREATE TABLE IF NOT EXISTS event_stratum (
    id_event  integer REFERENCES event(id),
    id_stratum integer REFERENCES stratum(id),
    connect_time timestamp);

CREATE TABLE IF NOT EXISTS test_question (
   id_test integer REFERENCES test(id),
   id_question  integer REFERENCES question(id));

CREATE TABLE IF NOT EXISTS  type_participant(
    id  INTEGER PRIMARY KEY, 
    type VARCHAR(45),
    description TEXT );

CREATE TABLE IF NOT EXISTS person_stratum (
   id_stratum integer REFERENCES stratum (id),
   id_person  integer REFERENCES person(id),
   id_type_participant  integer REFERENCES type_participant(id));



-- Заполнение таблиц
-- персоны
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (1, 'Александра', 'Александрова','Александровна', 'Sasha@email.ru', 'Sasha', '123456' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (2, 'Василиса', 'Васильева','Васильевна', 'Vasilisa@email.ru', 'Vasilisa', '234567' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (3, 'Ольга', 'Олегова','Олеговна', 'Olia@email.ru', 'Olia', '345678' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (4, 'Дарья', 'Дариевна','Дарьева', 'Dasha@email.ru', 'Dasha', '456789' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (5, 'Юлия', 'Юльева','Юлиевна', 'Yulia@email.ru', 'Yulia', '567891' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (6, 'Василий', 'Пупкин','Александровна', 'Vasia@email.ru', 'Vasia', '678912' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (7, 'Федор', 'Сумкин','Федорович', 'Fiedor@email.ru', 'Fiedor', '789123' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (8, 'Иван', 'Королев','Васильевич', 'Ivan_K@email.ru', 'Ivan_K', '891234' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (9, 'Иван', 'Царев','Иванович', 'Ivan_C@email.ru', 'Ivan_C', '912345' );
INSERT INTO person ( id, first_name, last_name, second_name, e_mail, login , password)  VALUES (10, 'Джон', 'Доу','Джонович', 'John@email.ru', 'John', 'admin' );

-- группы
INSERT INTO type_stratum (  id, type, description)  VALUES (1, 'Группа ВУЗ', 'Группа для общего прохождения теста от ВУЗа');

INSERT INTO stratum (  id, name, description, id_creater, ParentId, id_type_stratum)  VALUES (1, 'группа НЯ-1', 'Группа 1 курса факультета "Необычяйные явления"', 10, NULL, 1);
INSERT INTO stratum (  id, name, description, id_creater, ParentId, id_type_stratum)  VALUES (2, 'группа НЛО-1', 'Группа 1 курса факультета "Неопознаных летающих объектов"', 10, NULL, 1);

INSERT INTO type_participant (  id, type, description)  VALUES (1, 'Здающий', 'Персона проходящая тест');
INSERT INTO type_participant (  id, type, description)  VALUES (2, 'Принимающий', 'Персона получающая право на просмотр и редактирование группы и получающая результаты прохождения тестов');

INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (1 , 1, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (2 , 2, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (1 , 3, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (2 , 4, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (1 , 5, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (2 , 6, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (1 , 7, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (2 , 8, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (1 , 9, 1);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (1 , 10, 2);
INSERT INTO person_stratum (  id_stratum, id_person, id_type_participant )  VALUES (2 , 10, 2);


-- тесты
INSERT INTO test (  id, short_name, description, pass_level_norm, pass_level_good, pass_level_perf, id_creater, ParentId)  
                 VALUES (1, 'Математика', 'Основы математики', 50, 70, 90, 10, NULL);
INSERT INTO test (  id, short_name, description, pass_level_norm, pass_level_good, pass_level_perf, id_creater, ParentId)  
                 VALUES (2, 'Арифметика', 'Основы арифметики', 50, 70, 90, 10, 1);
INSERT INTO test (  id, short_name, description, pass_level_norm, pass_level_good, pass_level_perf, id_creater, ParentId)  
                 VALUES (3, 'Алгебра', 'Основы алгебры', 50, 70, 90, 10, 1);

-- вопросы

INSERT INTO type_question (  id, type, description)  VALUES (1, 'Вопрос с еденичным выбором', 'Для правильного ответа нужно выбрать единственный верный вариант ответа');
INSERT INTO type_question (  id, type, description)  VALUES (2, 'Вопрос с множественным выбором', 'Для правильного ответа нужно выбрать все верные и ни одного неверного варианта ответа');
INSERT INTO type_question (  id, type, description)  VALUES (3, 'Вопрос с ответом', 'Для правильного ответа нужно вписать в поле для ответа верный вариант ответа');

INSERT INTO question (  id, text, id_creater, id_type_question)  VALUES (1, 'Чему равно 2+2', 10, 1);
INSERT INTO question (  id, text, id_creater, id_type_question)  VALUES (2, 'Выражение для x при  y=2/x будет равно? ', 10, 1);
INSERT INTO question (  id, text, id_creater, id_type_question)  VALUES (3, 'Чему равно 15/3', 10, 3);
INSERT INTO question (  id, text, id_creater, id_type_question)  VALUES (4, 'Выберете верно сказанное про простые числа ', 10, 2);
INSERT INTO question (  id, text, id_creater, id_type_question)  VALUES (5, 'Есть ли жизнь на Марсе', 10, 1);

INSERT INTO test_question (id_test, id_question) VALUES (1,5);
INSERT INTO test_question (id_test, id_question) VALUES (2,1);
INSERT INTO test_question (id_test, id_question) VALUES (2,3);
INSERT INTO test_question (id_test, id_question) VALUES (3,2);
INSERT INTO test_question (id_test, id_question) VALUES (3,4);

-- ответы
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (1, '4', 'Доказательство этого вне пределах знаний автора',100, 10, 1);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (2, '5', 'Доказательство этого вне пределах знаний автора',0, 10, 1);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (3, 'x=2*y', 'Доказательство этого вне пределах знаний автора',0, 10, 2);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (4, 'x=2/y', 'Доказательство этого вне пределах знаний автора',100, 10, 2);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (5, '5', 'Доказательство этого вне пределах знаний автора',100, 10, 3);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (6, 'Они не существуют', 'Доказательство этого вне пределах знаний автора',-1, 10, 4);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (7, 'Они всегда нечетные.', 'Доказательство этого вне пределах знаний автора',1, 10, 4);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (8, 'Деляться только на себя и на 1.', 'Доказательство этого вне пределах знаний автора',1, 10, 4);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (9, 'Есть! Я верю!', 'Доказательство этого вне пределах знаний автора',100, 10, 5);
INSERT INTO answer  (id, text, explanation, correct, id_creater, id_question)  VALUES (10, 'Неизвестно. Ведуться исследования.', 'Доказательство этого вне пределах знаний автора',0, 10, 5);
    
-- события
INSERT INTO event_type (  id, type, description)  VALUES (1, 'Незначительное', 'Рядовое событие проходящее переодически');
INSERT INTO event_type (  id, type, description)  VALUES (2, 'Важное', 'Важное событие проходящее достаточно редко и требующее повышенного внимания');

INSERT INTO event (id, description, start_date, finish_date, id_creater, id_type_event)  VALUES (1, 'Контрольная по математике','2018-08-27 12:00:00' ,'2018-08-27 13:00:00', 10, 1);

INSERT INTO event_test(id_event, id_test) VALUES (1,1);    

INSERT INTO event_stratum(id_event, id_stratum, connect_time) VALUES (1,1,'2018-08-27 11:30:00');
INSERT INTO event_stratum(id_event, id_stratum, connect_time) VALUES (1,2,'2018-08-27 11:31:00');

-- результаты

INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 1 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 2 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 3 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 4 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 5 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 2, 6 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 7 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 8 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 1, 9 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 3, 1 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 3, 2 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 3, 3 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 4, 4 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 3, 5 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 3, 6 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 4, 7 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 4, 8 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 4, 9 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 1 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 2 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 3 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 4 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 5 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 6 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 7 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('5', '2018-08-28 12:35:00', 1, 5, 8 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES ('4', '2018-08-28 12:35:00', 1, 5, 9 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 6, 8 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 7, 1 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 7, 2 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 7, 4 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 7, 6 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 7, 7 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 7, 9 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 1 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 2 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 3 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 4 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 5 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 6 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 7 );
INSERT INTO resault_person( value, data, id_event, id_answer, id_person ) VALUES (NULL, '2018-08-28 12:35:00', 1, 8, 9 ); 







--  1. 10 запросов
--  1.1 Получить список событий с параметрами
SELECT 
     row_number() OVER () as №, 
     description, 
     start_date, 
     finish_date, 
     person.first_name,
     count(event_test.id_event) as count_test, 
     count(event_stratum.id_event) as count_stratum,
     count(event_person.id_event) as count_free_person   
FROM event 
     LEFT JOIN event_test 
           ON event.id = event_test.id_event  
     LEFT JOIN event_stratum 
          ON event.id = event_stratum.id_event  
     LEFT JOIN event_person
          ON event.id = event_person.id_event
     JOIN person
           ON event.id_creater = person.id 
GROUP BY event.id,   person.first_name;

--  1.2 Получить список тестов с параметерами
WITH  count_question_in_test as (
         SELECT 
                test.id as id, 
               count(test_question.id_question) as count 
         FROM test 
                LEFT  JOIN test_question
                     ON test.id = test_question.id_test
        GROUP BY test.id
)
SELECT 
    row_number() OVER () as №, 
    t1.short_name,
    t1.description,
    t1.pass_level_norm  || '%' as pass_norm,
    t1.pass_level_good || '%' as pass_good,
    t1.pass_level_perf || '%' as pass_perf,
    person.first_name || ' ' || person.last_name creator,
    count(t2.id) as count_include_test,
    (SELECT count FROM count_question_in_test WHERE count_question_in_test.id = t1.id ) as count_question_test
    FROM test as t1 
       LEFT JOIN test as t2
            ON t1.id = t2.ParentId 
      LEFT JOIN count_question_in_test as c
            ON t1.id = c.id
      JOIN person
           ON t1.id_creater = person.id 
GROUP BY t1.id,   person.first_name, person.last_name ;

--  1.3 Получить список участников stratum события
SELECT  s.id, s.name, s.description FROM stratum as s
JOIN event_stratum as es
ON s.id = es.id_stratum
WHERE es.id_event = 1;



--  1.4 Получить информацию о персонах 
SELECT * FROM person;
--  1.5 Получить список событий для персоны
SELECT * FROM event WHERE id in ( 
  (SELECT e1.id FROM event as e1
     JOIN event_person 
        ON event_person.id_person = 10)
   UNION 
   (SELECT e2.id FROM event as e2
      JOIN event_stratum as es
          ON es.id_event = e2.id
      JOIN person_stratum as ps
          ON es.id_stratum = ps.id_stratum
      WHERE ps.id_person= 10)
);

--  1.6 Получить информацию о песонах создающих контент 
SELECT * FROM person 
 JOIN  (
   (SELECT 'event' as type ,event.id_creater as id , count(event.id_creater) FROM event GROUP BY event.id_creater )
  UNION
    (SELECT 'test'as type,  test.id_creater as id  , count(test.id_creater) FROM test GROUP BY test.id_creater)
  UNION
    (SELECT 'stratum'as type, stratum.id_creater as id  , count(stratum.id_creater) FROM stratum GROUP BY stratum.id_creater )
  UNION
    (SELECT 'question'as type, question.id_creater as id  , count(question.id_creater) FROM question GROUP BY question.id_creater)
  UNION
    (SELECT 'answer'as type,answer.id_creater as id  , count(answer.id_creater ) FROM answer GROUP BY answer.id_creater)
) as t ON person.id = t.id;
 
--  1.7  Получить информацию об объектах созданных персоной
   (SELECT 'event' as type ,'' as name, event.description FROM event WHERE event.id_creater = 10)
  UNION
    (SELECT 'test' as type ,'' as name, test.description FROM test WHERE test.id_creater = 10)
  UNION
    (SELECT 'stratum' as type ,'' as name, stratum.description FROM stratum WHERE stratum.id_creater = 10)
  UNION
    (SELECT 'question' as type ,'' as name, question.text as description FROM question WHERE question.id_creater = 10)
  UNION
    (SELECT 'answer' as type ,'' as name, answer.text as description FROM answer WHERE answer.id_creater = 10)
ORDER BY type;
 
--  1.8 Получит инфрмацию о группах
SELECT  * FROM stratum;

--  1.9 Получить список участников группы
SELECT  * FROM person
       JOIN person_stratum as ps
            ON ps.id_person = person.id
WHERE ps.id_stratum = 1;
--  1.10 Получить список событий для группы
SELECT * FROM event as e 
    JOIN event_stratum as es
         ON e.id = es.id_event
WHERE es.id_stratum = 2;
--  1.11 Получить список тестов в событии 
SELECT * FROM test as t
    JOIN event_test as et
        ON et.id_test = t.id
WHERE et.id_event = 1;

--  2. 2 вьюшки
--  2.1 Получить status прохождения евентов 
CREATE OR REPLACE VIEW status_event as 
       SELECT event.id, event.description,
            CASE WHEN event.finish_date < NOW() THEN  'завершено'
                         WHEN event.start_date > NOW() THEN 'ожидается начало'
                         ELSE 'в процессе'
            END
        FROM event;
SELECT * FROM status_event;
--  2.2 Получить список вопросов с ответами длинной n

CREATE OR REPLACE VIEW status_person_event as 
SELECT 
        p.id, 
        p.first_name , 
       CASE 
              WHEN count(rp.id_answer) > 0 THEN 'приступил'
              ELSE 'ожидается первый ответ' 
       END
FROM person as p
     LEFT JOIN  resault_person as rp 
          ON  p.id = rp.id_person
     JOIN ((SELECT e.id as id_event, ep.id_person
           FROM event as e
              JOIN event_person as ep
                    ON e.id = ep.id_event)
          UNION
          (SELECT e.id as id_event, ps.id_person 
           FROM event as e
            JOIN event_stratum as es
                  ON   e.id = es.id_event
             JOIN person_stratum as ps
                   ON es.id_stratum=ps.id_stratum)
          ) as t
    ON t.id_person = p.id
    GROUP BY p.id;

SELECT * FROM status_person_event;