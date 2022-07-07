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
-- Insert the following data for vets
INSERT INTO vets (name, age, date_of_graduation) -- Vet William Tatcher is 45 years old and graduated Apr 23rd, 2000.
VALUES ('William Tatcher', 45, '2000-04-23'),
    -- Vet Maisy Smith is 26 years old and graduated Jan 17th, 2019.
    ('Maisy Smith', 26, '2019-01-17'),
    -- Vet Stephanie Mendez is 64 years old and graduated May 4th, 1981.
    ('Stephanie Mendez', 64, '1981-05-04'),
    --Vet Jack Harkness is 38 years old and graduated Jun 8th, 2008.
    ('Jack Harkness', 38, '2008-06-08');
-- Insert the following data for specialties:
INSERT INTO specializations (species_id, vets_id) -- Vet William Tatcher is specialized in Pokemon.
VALUES(
        (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        )
    ),
    -- Vet Stephanie Mendez is specialized in Digimon and Pokemon.
    (
        (
            SELECT id
            FROM species
            WHERE name = 'Pokemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    (
        (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        )
    ),
    -- Vet Jack Harkness is specialized in Digimon.
    (
        (
            SELECT id
            FROM species
            WHERE name = 'Digimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        )
    );
-- Insert the following data for visits:
INSERT INTO visits(animals_id, vets_id, date_of_visit) -- Agumon visited William Tatcher on May 24th, 2020.
VALUES(
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        '2020-06-24'
    ),
    -- Agumon visited Stephanie Mendez on Jul 22th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Agumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2020-07-22'
    ),
    -- Pikachu visited Maisy Smith on Jan 5th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-01-05'
    ),
    -- Gabumon visited Jack Harkness on Feb 2nd, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Gabumon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2021-02-02'
    ),
    -- Pikachu visited Maisy Smith on Mar 8th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-03-08'
    ),
    -- Pikachu visited Maisy Smith on May 14th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Pikachu'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-06-14'
    ),
    -- Devimon visited Stephanie Mendez on May 4th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Devimon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2021-06-04'
    ),
    -- Charmander visited Jack Harkness on Feb 24th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Charmander'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2021-02-24'
    ),
    -- Plantmon visited Maisy Smith on Dec 21st, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2019-12-21'
    ),
    -- Plantmon visited William Tatcher on Aug 10th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        '2020-09-10'
    ),
    -- Plantmon visited Maisy Smith on Apr 7th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Plantmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2021-04-17'
    ),
    -- Squirtle visited Stephanie Mendez on Sep 29th, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Squirtle'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2019-09-29'
    ),
    -- Angemon visited Jack Harkness on Oct 3rd, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2020-10-03'
    ),
    -- Angemon visited Jack Harkness on Nov 4th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Angemon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Jack Harkness'
        ),
        '2020-11-04'
    ),
    -- Boarmon visited Maisy Smith on Jan 24th, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2019-01-24'
    ),
    -- Boarmon visited Maisy Smith on May 15th, 2019.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2019-06-15'
    ),
    -- Boarmon visited Maisy Smith on Feb 27th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-02-27'
    ),
    -- Boarmon visited Maisy Smith on Aug 3rd, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Boarmon'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Maisy Smith'
        ),
        '2020-09-03'
    ),
    -- Blossom visited Stephanie Mendez on May 24th, 2020.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'Stephanie Mendez'
        ),
        '2020-06-24'
    ),
    -- Blossom visited William Tatcher on Jan 11th, 2021.
    (
        (
            SELECT id
            FROM animals
            WHERE name = 'Blossom'
        ),
        (
            SELECT id
            FROM vets
            WHERE name = 'William Tatcher'
        ),
        '2021-01-11'
    );