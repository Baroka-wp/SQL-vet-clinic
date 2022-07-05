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
SELECT MAX(escape_attempts)
FROM animals
GROUP BY neutered;
-- result : 7 | 5
-- What is the minimum and maximum weight of each type of animal?
SELECT MAX(weight_kg),
    MIN(weight_kg)
FROM animals;
-- result : MIN = 5.7 | MAX = 45
-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01'
GROUP BY species;
-- result : 3.000