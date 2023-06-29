--
-- Class Companyw as table companytablew
--

CREATE TABLE "companytablew" (
  "id" serial,
  "name" text NOT NULL,
  "idcompany" text NOT NULL,
  "iduserlist" json
);

ALTER TABLE ONLY "companytablew"
  ADD CONSTRAINT companytablew_pkey PRIMARY KEY (id);


--
-- Class Todo as table todotable
--

CREATE TABLE "todotable" (
  "id" serial,
  "name" text NOT NULL,
  "idtodo" text NOT NULL,
  "idcompany" text NOT NULL,
  "datetimecreate" text NOT NULL,
  "description" text NOT NULL,
  "priority" text NOT NULL,
  "idusercreater" text NOT NULL,
  "iduserexecutor" text NOT NULL
);

ALTER TABLE ONLY "todotable"
  ADD CONSTRAINT todotable_pkey PRIMARY KEY (id);


--
-- Class User as table usertable
--

CREATE TABLE "usertable" (
  "id" serial,
  "name" text NOT NULL,
  "iduser" text NOT NULL,
  "login" text NOT NULL,
  "password" text NOT NULL,
  "email" text NOT NULL
);

ALTER TABLE ONLY "usertable"
  ADD CONSTRAINT usertable_pkey PRIMARY KEY (id);


