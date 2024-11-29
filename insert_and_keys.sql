INSERT INTO analysis.colors (
	SELECT * FROM staging.colors
);

INSERT INTO analysis.inventories (
	SELECT * FROM staging.inventories
);

INSERT INTO analysis.inventory_parts (
	SELECT * FROM staging.inventory_parts
);

INSERT INTO analysis.inventory_sets (
	SELECT * FROM staging.inventory_sets
);

INSERT INTO analysis.part_categories (
	SELECT * FROM staging.part_categories
);

INSERT INTO analysis.parts (
	SELECT * FROM staging.parts
);

INSERT INTO analysis.sets (
	SELECT * FROM staging.sets
);

INSERT INTO analysis.themes (
	SELECT 
		id,
		name,
		CAST(parent_id as smallint)
	FROM staging.themes
);

INSERT INTO analysis.parts (
	SELECT DISTINCT
		IP.part_num,
		NULL as name,
		CAST(NULL as smallint) as part_cat_id
		FROM analysis.inventory_parts as IP
	LEFT JOIN analysis.parts as P ON IP.part_num = P.part_num
	WHERE P.part_num IS NULL
);




-- Add primary keys
ALTER TABLE analysis.colors ADD PRIMARY KEY (id);
ALTER TABLE analysis.inventories ADD PRIMARY KEY (id);
ALTER TABLE analysis.parts ADD PRIMARY KEY (part_num);
ALTER TABLE analysis.part_categories ADD PRIMARY KEY (id);
ALTER TABLE analysis.sets ADD PRIMARY KEY (set_num);
ALTER TABLE analysis.themes ADD PRIMARY KEY (id);

-- Add foreign keys
ALTER TABLE analysis.parts ADD FOREIGN KEY (part_cat_id) 
	REFERENCES analysis.part_categories(id);


ALTER TABLE analysis.inventory_parts ADD FOREIGN KEY (inventory_id) 
	REFERENCES analysis.inventories(id);

ALTER TABLE analysis.inventory_parts ADD FOREIGN KEY (part_num) 
	REFERENCES analysis.parts(part_num);

ALTER TABLE analysis.inventory_parts ADD FOREIGN KEY (color_id) 
	REFERENCES analysis.colors(id);


ALTER TABLE analysis.inventory_sets ADD FOREIGN KEY (inventory_id) 
	REFERENCES analysis.inventories(id);

ALTER TABLE analysis.inventory_sets ADD FOREIGN KEY (set_num) 
	REFERENCES analysis.sets(set_num);


ALTER TABLE analysis.sets ADD FOREIGN KEY (theme_id) 
	REFERENCES analysis.themes(id);


ALTER TABLE analysis.inventories ADD FOREIGN KEY (set_num) 
	REFERENCES analysis.sets(set_num);