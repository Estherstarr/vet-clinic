/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
id integer,
name text,
date_of_birth date,
escape_attempts integer,
neutered boolean,
weight_kg decimal
);

ALTER TABLE animals
ADD COLUMN species text;


-- Remove column species
ALTER TABLE animals DROP COLUMN species
-- species field column
ALTER TABLE animals ADD species CHAR(250);

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals
ADD species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species_table FOREIGN KEY(species_id) REFERENCES species(id);

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals
ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owner_table FOREIGN KEY(owner_id) REFERENCES owners(id);
