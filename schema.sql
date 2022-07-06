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