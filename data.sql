/* Populate database with sample data. */
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Agumon', '2020-02-03', 10.23, TRUE, 0);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Gabumon', '2018-11-15', 8, TRUE, 2);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Pikachu', '2021-01-07', 15.04, FALSE, 1);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Devimon', '2017-05-12', 11, FALSE, 5);
------------------------ Add new data -------------------------
BEGIN;
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Charmander', '2020-02-08', 11, FALSE, 0);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Plantmon', '2021-11-15', 5.7, TRUE, 2);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Squirtle', '1993-04-02', 12.13, FALSE, 3);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Angemon', '2005-06-12', 45, TRUE, 1);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Boarmon', '2005-06-07', 20.4, TRUE, 7);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Blossom', '1998-10-13', 17, TRUE, 3);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Ditto', '2022-05-14', 22, TRUE, 4);
COMMIT;
-- update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals
SET species = 'unspecified';
ROLLBACK;
/* Update the animals table by setting the species column to digimon 
 for all animals that have a name ending in mon*/
BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
/* Update the animals table by setting the species column 
 to pokemon for all animals that don't have species already set.*/
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
-- commit the transaction 
COMMIT;
-- Verify changes
BEGIN;
-- delete all records in the animals table
DELETE FROM animals;
-- rollback the transaction
ROLLBACK;
---------------------------------
BEGIN;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
-- Create a savepoint for the transaction.
SAVEPOINT SP1;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = weight_kg * -1;
-- Rollback to the savepoint
ROLLBACK TO SP1;
-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
-- Commit transaction
COMMIT;
SELECT *
FROM animals;