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
VALUES('Charmander', '2020-02-08', -11, FALSE, 0);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Plantmon', '2022-11-15', -5.7, TRUE, 2);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Squirtle', '1993-04-02', -12.13, FALSE, 3);
INSERT INTO animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
VALUES('Angemon', '2005-06-12', -45, TRUE, 1);
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
/* Modify your inserted animals so it includes the species_id value:--
 - If the name ends in "mon" it will be Digimon
 - All other animals are Pokemon
 */
BEGIN;
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
    )
WHERE name LIKE '%mon';
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Pokemen'
    )
WHERE name NOT LIKE '%mon';
COMMIT;
/*
 Modify your inserted animals to include owner information (owner_id):
 - Sam Smith owns Agumon.
 - Jennifer Orwell owns Gabumon and Pikachu.
 - Bob owns Devimon and Plantmon.
 - Melody Pond owns Charmander, Squirtle, and Blossom.
 - Dean Winchester owns Angemon and Boarmon.
 */
-- Sam Smith owns Agumon.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Sam Smith'
    )
WHERE name = 'Agumon';
-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Jennifer Orwell'
    )
WHERE name = 'Gabumon'
    OR name = 'Pikachu';
-- Bob owns Devimon and Plantmon.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Bob'
    )
WHERE name = 'Devimon'
    OR name = 'Plantmon';
-- Melody Pond owns Charmander, Squirtle, and Blossom.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Melody Pond'
    )
WHERE name = 'Charmander'
    OR name = 'Squirtle'
    OR name = 'Blossom';
-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE full_name = 'Dean Winchester'
    )
WHERE name = 'Angemon'
    OR name = 'Boarmon';