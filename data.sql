/* Populate database with sample data. */
INSERT INTO animals (
name,
date_of_birth,
escape_attempts,
neutered,
weight_kg)
VALUES ('Agumon', date '2020/02/03', 0, false, 10.23);

INSERT INTO animals (
name,
date_of_birth,
escape_attempts,
neutered,
weight_kg)
VALUES ('Gabumon', date '2018/11/15', 2, false, 8);

INSERT INTO animals (
name,
date_of_birth,
escape_attempts,
neutered,
weight_kg)
VALUES ('Pikachu', date '2021/01/07', 1, false, 15.04);

 INSERT INTO animals (
name,
date_of_birth,
escape_attempts,
neutered,
weight_kg)
VALUES ('Devimon', date '2017/05/12', 5, true, 11);

 INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) 
VALUES 
('Charmander', '2020-02-08', 0, false, -11),
('Plantmon', '2021-11-15', 2, true, -5.7),
('Squirtle', '1993-04-02', 3, false, -12.13),
('Angemon', '2005-06-12', 1, true, -45),
('Boarmon', '2005-05-07', 7, true, 20.4),
('Blossom', '1998-10-13', 3, true, 17.0),
('Ditto', '2022-05-14', 4, true, 22.0);


-- INSERT INTO OWNERS TABLE 
INSERT INTO owners (fullname, age) VALUES ('Sam Smith', 34),
 ('Jennifer Orwell', 19),
 ('BOB', 45),
 ('Melody Pond', 77),
 ('Dean Winchester', 14),
 ('Joddie Whittaker', 14);

-- INSERT INTO SPECIES TABLE 
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');

-- If the name ends in "mon" it will be Digimon
-- All other animals are Pokemon
UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Digimon'
    )
WHERE name LIKE '%mon%';

UPDATE animals
SET species_id = (
        SELECT id
        FROM species
        WHERE name = 'Pokemen'
)
WHERE species_id is null;

 -- Sam Smith owns Agumon
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE fullname = 'Sam Smith'
    )
WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE fullname = 'Jennifer Orwell'
    )
WHERE name = 'Gabumon'
OR name = 'Pikachu';

 -- Bob owns Devimon and Plantmon
UPDATE animals
SET owner_id = (
        SELECT id
        FROM owners
        WHERE fullname = 'BOB'
    )
WHERE name = 'Devimon'
OR name = 'Plantmon';
