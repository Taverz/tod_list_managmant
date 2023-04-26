--
-- Class Example as table example
--

CREATE TABLE "example" (
  "id" serial,
  "name" text NOT NULL,
  "data" integer NOT NULL
);

ALTER TABLE ONLY "example"
  ADD CONSTRAINT example_pkey PRIMARY KEY (id);


