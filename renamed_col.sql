-- Generate the Renamed Column List Automatically

SELECT
    column_name,
    lower(regexp_replace(column_name, ' ', '_')) AS new_column_name
FROM information_schema.columns
WHERE table_schema = 'raw_zone_db'
  AND table_name = 'aws_test';
