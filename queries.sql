/*Queries that provide answers to the questions from all projects.*/
SELECT *
FROM animals
WHERE name LIKE '%mon';
SELECT name
FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name
FROM animals
WHERE neutered = TRUE
    AND escape_attempts < 3;
SELECT date_of_birth
FROM animals
WHERE name IN ('Agumon', 'Pikachu');
SELECT name,
    escape_attempts
FROM animals
WHERE weight_kg > 10.5;
SELECT *
FROM animals
WHERE neutered = TRUE;
SELECT *
FROM animals
WHERE name != 'Gabumon';
SELECT *
FROM animals
WHERE weight_kg >= 10.4
    AND weight_kg <= 17.3;
-- update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals
SET species = 'unspecified';
SELECT species
FROM animals;
ROLLBACK;
SELECT species
FROM animals;
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
SELECT species
FROM animals;
-- commit the transaction 
COMMIT;
SELECT species
FROM animals;
-- Verify changes
BEGIN;
-- delete all records in the animals table
DELETE FROM animals;
SELECT COUNT(*)
FROM ANIMALS;
-- rollback the transaction
ROLLBACK;
SELECT COUNT(*)
FROM ANIMALS;
------------------Transactions---------------
BEGIN;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
-- Create a savepoint for the transaction.
SAVEPOINT SP1;
SELECT COUNT(*)
FROM animals;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals
SET weight_kg = -1 * weight_kg;
SELECT weight_kg
FROM animals;
-- Rollback to the savepoint
ROLLBACK TO SP1;
SELECT weight_kg
FROM animals;
-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
SELECT weight_kg
FROM animals;
-- Commit transaction
COMMIT;
SELECT weight_kg
FROM animals;
-- Aggrgation ------
-- How many animals are there?
SELECT COUNT(*)
FROM animals;
-- result : 10
-- How many animals have never tried to escape?
SELECT COUNT(*)
FROM animals
WHERE escape_attempts = 0;
-- result : 2
-- What is the average weight of animals?
SELECT AVG(weight_kg)
FROM animals;
-- result : 15.5500
-- Who escapes the most, neutered or not neutered animals?
SELECT neutered,
    MAX(escape_attempts)
FROM animals
GROUP BY neutered;
-- result : 7 | 5
-- What is the minimum and maximum weight of each type of animal?
SELECT species,
    MAX(weight_kg),
    MIN(weight_kg)
FROM animals
GROUP BY species;
-- result : MIN = 5.7 | MAX = 45
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,
    AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
-- result : 3.000
--- QUERY UNSING JOIN ---
-- What animals belong to Melody Pond?
SELECT name,
    full_name
FROM animals
    JOIN owners ON animals.owner_id = owners.id
WHERE full_name = 'Melody Pond';
-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name as animals,
    species.name as species
FROM animals
    JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';
-- List all owners and their animals, remember to include those that don't own any animal.
SELECT name AS Animals,
    full_name AS Owners
FROM animals
    RIGHT JOIN owners ON animals.owner_id = owners.id;
-- How many animals are there per species?
SELECT COUNT(animals.name) AS Animals_count,
    species.name AS Specie
FROM animals
    JOIN species ON animals.species_id = species.id
GROUP BY species.name;
-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name,
    animals.name AS name_of_animals,
    species.name AS name_of_species
FROM animals
    JOIN owners ON owners.id = animals.owner_id
    JOIN species ON species.id = animals.species_id
WHERE owners.full_name = 'Jennifer Orwell'
    AND species.name = 'Digimon';
-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT name,
    escape_attempts,
    full_name
FROM animals
    JOIN owners ON owners.id = animals.owner_id
WHERE owners.full_name = 'Dean Winchester'
    AND animals.escape_attempts = 0;
-- Who owns the most animals?
SELECT full_name,
    COUNT(animals.owner_id) AS Owns
FROM owners
    JOIN animals ON animals.owner_id = owners.id
GROUP BY full_name
ORDER BY Owns DESC;