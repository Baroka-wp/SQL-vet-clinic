/* Database schema to keep the structure of entire database. */
CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INT,
  neutered BOOLEAN,
  weight_kg DECIMAL,
  PRIMARY KEY(id)
);
-- Add a column species of type string to your animals table.
ALTER TABLE animals
ADD species VARCHAR(100);
-- Create a table named owners with the following columns
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100)
);
--Create a table named species with the following columns
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  full_name VARCHAR(100),
  age INT
);
-- Remove column species
ALTER TABLE animals DROP COLUMN species;
-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species_table FOREIGN KEY(specices_id) REFERENCES species(id);
-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owner_table FOREIGN KEY(owner_id) REFERENCES owners(id);
-- Create a table named vets with the following columns:
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(50),
  age INT,
  date_of_graduation DATE
);
-- Create a "join table" called specializations to handle this relationship.
CREATE TABLE specializations(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  species_id INT,
  vets_id INT,
  CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id),
  CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);
-- Create a "join table" called visits to handle this relationship, it should also keep track of the date of the visit.
CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  animals_id INT,
  vets_id INT,
  date_of_visit DATE,
  CONSTRAINT fk_visit_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
  CONSTRAINT fk_visits_vet FOREIGN KEY(vets_id) REFERENCES vets(id)
);
-- Add an email column to your owners table
ALTER TABLE owners
ADD COLUMN email VARCHAR(120);
-- CREATE INDEX TO OPTIMAZE QUERY ---
CREATE INDEX visits_animal_id_idx ON visits(animals_id);
CREATE INDEX visits_vet_id_idx ON visits(vets_id);
CREATE INDEX owners_email_idx ON owners(email);