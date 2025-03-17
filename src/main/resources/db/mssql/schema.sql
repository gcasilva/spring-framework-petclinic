-- SQL Server schema for Spring PetClinic

-- Drop tables if they exist
IF OBJECT_ID('vets_specialties', 'U') IS NOT NULL DROP TABLE vets_specialties;
IF OBJECT_ID('specialties', 'U') IS NOT NULL DROP TABLE specialties;
IF OBJECT_ID('visits', 'U') IS NOT NULL DROP TABLE visits;
IF OBJECT_ID('pets', 'U') IS NOT NULL DROP TABLE pets;
IF OBJECT_ID('types', 'U') IS NOT NULL DROP TABLE types;
IF OBJECT_ID('owners', 'U') IS NOT NULL DROP TABLE owners;
IF OBJECT_ID('vets', 'U') IS NOT NULL DROP TABLE vets;

-- Create tables
CREATE TABLE vets (
  id   INT IDENTITY(1,1) PRIMARY KEY,
  first_name  VARCHAR(30),
  last_name   VARCHAR(30)
);

CREATE TABLE specialties (
  id   INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(80)
);

CREATE TABLE vets_specialties (
  vet_id       INT NOT NULL,
  specialty_id INT NOT NULL,
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (specialty_id) REFERENCES specialties(id),
  CONSTRAINT unique_ids UNIQUE (vet_id, specialty_id)
);

CREATE TABLE types (
  id   INT IDENTITY(1,1) PRIMARY KEY,
  name VARCHAR(80)
);

CREATE TABLE owners (
  id         INT IDENTITY(1,1) PRIMARY KEY,
  first_name VARCHAR(30),
  last_name  VARCHAR(30),
  address    VARCHAR(255),
  city       VARCHAR(80),
  telephone  VARCHAR(20)
);

CREATE TABLE pets (
  id         INT IDENTITY(1,1) PRIMARY KEY,
  name       VARCHAR(30),
  birth_date DATE,
  type_id    INT NOT NULL,
  owner_id   INT NOT NULL,
  FOREIGN KEY (owner_id) REFERENCES owners(id),
  FOREIGN KEY (type_id) REFERENCES types(id)
);

CREATE TABLE visits (
  id          INT IDENTITY(1,1) PRIMARY KEY,
  pet_id      INT NOT NULL,
  visit_date  DATE,
  description VARCHAR(255),
  FOREIGN KEY (pet_id) REFERENCES pets(id)
);