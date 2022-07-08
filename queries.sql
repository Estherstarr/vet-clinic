/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name from animals WHERE escape_attempts < 3 AND neutered = true;
SELECT date_of_birth from animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;
SELECT * from animals WHERE neutered = true;
SELECT * from animals WHERE name != 'Gabumon';
SELECT * from animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;


-- Update species column data using transaction --
begin;
    UPDATE animals SET species = 'unspecified';
ROLLBACK;


-- Update species column data using transaction --
Begin;

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon%';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
UPDATE animals
SET species = 'pokemon'
WHERE species is null;

COMMIT;


-- Delete all data in the animals table 

BEGIN;
   TRUNCATE TABLE animals
ROLLBACK;

SELECT * FROM animals

-- Start transaction

BEGIN;
--Delete all animals born after Jan 1st, 
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP_1;
SELECT * FROM animals;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals
SET weight_kg = -1 * weight_kg;

SELECT * FROM animals
ROLLBACK TO SP_1

SELECT weight_kg FROM animals

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
SELECT weight_kg
FROM animals;
-- Commit transaction
COMMIT;


-- Get all animals from the table
SELECT COUNT(*) FROM animals
-- Animals that have never tried to escape
SELECT COUNT(*) FROM animals WHERE escape_attempts < 1
-- Average weight of animals
SELECT AVG(weight_kg) FROM animals
-- Animals who escaped the most, neutered or not neutered animals
SELECT neutered,
    MAX(escape_attempts)
FROM animals
GROUP BY neutered;

-- The minimum and maximum weight of each type of animal
SELECT species,
    MAX(weight_kg),
    MIN(weight_kg)
FROM animals
GROUP BY species;

-- average number of escape attempts per animal type of those born between 1990 and 2000
SELECT species,
    AVG(escape_attempts)
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;
