-- CREATE SCHEMA analysis;

-- SELECT 
-- 	MIN(id),
-- 	MAX(id),
-- 	MAX(LENGTH(name)),
-- 	MAX(LENGTH(rgb)),
-- 	MAX(LENGTH(is_trans))
-- FROM staging.colors;

-- SELECT 
-- 	MIN(id),
-- 	MAX(id),
-- 	MIN(version),
-- 	MAX(version),
-- 	MAX(LENGTH(set_num))
-- FROM staging.inventories;

-- SELECT
-- 	MIN(inventory_id),
-- 	MAX(inventory_id),
-- 	MAX(LENGTH(part_num)),
-- 	MIN(color_id),
-- 	MAX(color_id),
-- 	MIN(quantity),
-- 	MAX(quantity),
-- 	MAX(LENGTH(is_spare))
-- FROM staging.inventory_parts;


-- SELECT 
-- 	MIN(id),
-- 	MAX(id),
-- 	MAX(LENGTH(name))
-- FROM staging.part_categories;


-- SELECT  
-- 	MIN(inventory_id),
-- 	MAX(inventory_id),
-- 	MAX(LENGTH(set_num)),
-- 	MIN(quantity),
-- 	MAX(quantity)
-- FROM staging.inventory_sets;

-- SELECT
-- 	MAX(LENGTH(part_num)),
-- 	MAX(LENGTH(name)), 
-- 	MIN(part_cat_id),
-- 	MAX(part_cat_id)
-- FROM staging.parts;

-- SELECT 
-- 	MAX(LENGTH(set_num)), 
-- 	MAX(LENGTH(name)),
-- 	MIN(year),
-- 	MAX(year),
-- 	MIN(theme_id),
-- 	MAX(theme_id),
-- 	MIN(num_parts),
-- 	MAX(num_parts)
-- FROM staging.sets;

-- SELECT 
-- 	MIN(id),
-- 	MAX(id),
-- 	MAX(LENGTH(name)), 
-- 	MIN(parent_id),
-- 	MAX(parent_id)
-- FROM staging.themes;

DROP TABLE IF EXISTS analysis.colors CASCADE;
DROP TABLE IF EXISTS analysis.inventories CASCADE;
DROP TABLE IF EXISTS analysis.inventory_parts CASCADE;
DROP TABLE IF EXISTS analysis.inventory_sets CASCADE;
DROP TABLE IF EXISTS analysis.part_categories CASCADE;
DROP TABLE IF EXISTS analysis.parts CASCADE;
DROP TABLE IF EXISTS analysis.sets CASCADE;
DROP TABLE IF EXISTS analysis.themes CASCADE;

CREATE TABLE analysis.colors (
	id smallint,
	name varchar(50),
	rgb varchar(6),
	is_trans varchar(1)
);

CREATE TABLE analysis.inventories (
	id smallint,
	version smallint,
	set_num varchar(20)
);

CREATE TABLE analysis.inventory_parts (
	inventory_id smallint,
	part_num varchar(15),
	color_id smallint,
	quantity smallint,
	is_spare varchar(1)
);

CREATE TABLE analysis.inventory_sets (
	inventory_id smallint,
	set_num varchar(10),
	quantity smallint
	);

CREATE TABLE analysis.part_categories (
	id smallint,
	name varchar(50)
);

CREATE TABLE analysis.parts (
	part_num varchar(15),
	name varchar(225),
	part_cat_id smallint
);

CREATE TABLE analysis.sets (
	set_num varchar(20),
	name varchar(100),
	year smallint,
	theme_id smallint,
	num_parts smallint
);

CREATE TABLE analysis.themes (
	id smallint,
	name varchar(50),
	parent_id smallint
);




