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
('1', '������', '����', '��������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('2', '������', '����', '��������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('3', '���������', '������', '�������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('4', '������', '���������', '���������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('5', '�����', '���������', '����������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('6', '�������', '����', '����������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('7', '�����', '�������', '��������������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('8', '�������', '������', '�����');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('9', '��������', '��������',  '����������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('10', '������', '�������', '���������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('11', '�������', '����', '��������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('12', '������', '����', '��������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('13', '�������', '�������', '�������������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('14', '�������', '�����', '����������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('15', '�������', '������', '���������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('16', '�������', '���', '����������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('17', '����', '���������', '�������������');

insert into "PERSON" ("ID", "FAMILY", "FIRST_NAME", "LAST_NAME") 
values
('18', '�����������', '������', '����������');


---------------------------- ������ ---------------------------------

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('1', '1', '�������', '����������', '1', '1');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('2', '2', '�������', '����������', '10', '11');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('3', '2', '�������������', '�����������', '12', '13');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('4', '3', '���������', '���������� �������', '14', ' ');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('5', '4', '������������', '����������', '123', ' ');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('6', '5', '������', '�.������', '10', '101');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('7', '6', '�����-���������', '���������������', '11', '00');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('8', '7', '������', '�������', '2', '44');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('9', '8', '������', '�����������', '66', '22');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('10', '9', '���������', '�������', '11', '11');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('11', '10', '������', '������� ��������', '99', '99');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('12', '11', '��������', '����������', '17', '1');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('13', '12', '���������', '������������', '71', '1');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('14', '13', '������', '�����-�����', '10', '10');


insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('15', '14', '������', '�����-�����', '10', '10');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('16', '15', '������', '�����-�����', '10', '10');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('17', '16', '����� ������', '���������������', '88', '77');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('18', '17', '������', '��������', '55�', '��');

insert into "ADDRESS" ("ID", "PERSON_ID", "CITY", "STREET", "HOUSE", "FLAT")
values
('19', '18', '������', '��������', '96', '69');

-------------------------------- AUTO ----------------------------------------

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('1', '1', 'Toyota', 'Camry');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('2', '2', 'Toyota', 'RAV4');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('3', '3', 'Lada', '������');

insert into "AUTO" ("ID", "PERSON_ID", "BRAND", "MODEL")
values
('4', '4', 'Kia', 'Rio');











