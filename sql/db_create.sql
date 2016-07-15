DROP TABLE public."ADDRESS";
DROP TABLE public."AUTO";
DROP TABLE public."PERSON";

-- Table: public."PERSON"


CREATE TABLE public."PERSON"
(
  "ID"          integer not null,
  "FAMILY"      character varying(64),
  "FIRST_NAME"  character varying(64),
  "LAST_NAME"   character varying(64),
  CONSTRAINT "PERSON_ID" PRIMARY KEY ("ID")
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."PERSON"
  OWNER TO postgres;


-- Table: public."ADDRESS"


CREATE TABLE public."ADDRESS"
(
    "ID"          integer not null,
    "PERSON_ID"   integer not null,
    "CITY"        character varying(64), 	
    "STREET"      character varying(64),
    "HOUSE"       character varying(16),
    "FLAT"        character varying(16),
  CONSTRAINT "ADDRESS_ID" PRIMARY KEY ("ID"),
  CONSTRAINT "ADDRESS_PERSON_FK" FOREIGN KEY ("PERSON_ID")
      REFERENCES public."PERSON" ("ID") MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."ADDRESS"
  OWNER TO postgres;


-- Table: public."AUTO"

-- DROP TABLE public."AUTO";

CREATE TABLE public."AUTO"
(
    "ID"         integer not null,
    "PERSON_ID"   integer not null,
    "BRAND"      character varying(64),
    "MODEL"      character varying(64),
  CONSTRAINT "AUTO_ID" PRIMARY KEY ("ID"),
  CONSTRAINT "AUTO_PERSON_FK" FOREIGN KEY ("PERSON_ID")
      REFERENCES public."PERSON" ("ID") MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public."AUTO"
  OWNER TO postgres;

--------------------------------------------------------------

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('1', 'Иванов', 'Иван', 'Иванович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('2', 'Петров', 'Петр', 'Петрович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('3', 'Лермонтов', 'Михаил', 'Юрьевич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('4', 'Пушкин', 'Александр', 'Сергеевич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('5', 'Быков', 'Александр', 'Дмитриевич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('6', 'Романов', 'Петр', 'Алексеевич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('7', 'Жуков', 'Георгий', 'Константинович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('8', 'Брежнев', 'Леонид', 'Ильич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('9', 'Бобриков', 'Эммануил',  'Гедеонович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('10', 'Ипатов', 'Ипполит', 'Матвеевич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('11', 'Баранов', 'Иван', 'Иванович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('12', 'Козлов', 'Петр', 'Петрович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('13', 'Романов', 'Николай', 'Александрович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('14', 'Романов', 'Федор', 'Михайлович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('15', 'Романов', 'Михаил', 'Федорович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('16', 'Толстой', 'Лев', 'Николаевич');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('17', 'Блок', 'Александр', 'Александрович');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('18', 'Дзержинский', 'Феликс', 'Эдмундович');


---------------------------- адреса ---------------------------------

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('1', '1', 'Иваново', 'Ивановская', '1', '1');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('2', '2', 'Петрово', 'Петровская', '10', '11');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('3', '2', 'Петропавловск', 'Центральная', '12', '13');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('4', '3', 'Пятигорск', 'Грузинская военная', '14', ' ');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('5', '4', 'Михайловское', 'Московская', '123', ' ');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('6', '5', 'Озерск', 'К.Маркса', '10', '101');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('7', '6', 'Санкт-Петербург', 'Петропавловская', '11', '00');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('8', '7', 'Калуга', 'Зеленая', '2', '44');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('9', '8', 'Москва', 'Кутузовский', '66', '22');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('10', '9', 'Шепетовка', 'Крайняя', '11', '11');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('11', '10', 'Васюки', 'Главный проспект', '99', '99');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('12', '11', 'Бараничи', 'Пионерская', '17', '1');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('13', '12', 'Козловичи', 'Бойскаутская', '71', '1');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('14', '13', 'Москва', 'Китай-город', '10', '10');


insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('15', '14', 'Москва', 'Китай-город', '10', '10');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('16', '15', 'Москва', 'Китай-город', '10', '10');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('17', '16', 'Ясная Поляна', 'Севастопольская', '88', '77');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('18', '17', 'Москва', 'Окружная', '55А', 'ББ');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('19', '18', 'Москва', 'Парковая', '96', '69');

-------------------------------- AUTO ----------------------------------------

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('1', '1', 'Toyota', 'Camry');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('2', '2', 'Toyota', 'RAV4');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('3', '3', 'Lada', 'Калина');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('4', '4', 'Kia', 'Rio');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('5', '5', 'Volvo', 'Sx-950');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('6', '6', 'Renault', 'Logan');









