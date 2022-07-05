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