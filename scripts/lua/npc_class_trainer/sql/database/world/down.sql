SET @ENTRY := 200005;

DELETE FROM creature_template
WHERE entry = @ENTRY;

DELETE FROM creature
WHERE id1 = @ENTRY;
