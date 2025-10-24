-- Generate SELECT statements for renaming columns

SELECT
    concat(
        '`', column_name, '` AS ',
        lower(regexp_replace(column_name, ' ', '_'))
    ) AS select_expression
FROM information_schema.columns
WHERE table_schema = 'raw_zone_db'
  AND table_name = 'aws_test';
