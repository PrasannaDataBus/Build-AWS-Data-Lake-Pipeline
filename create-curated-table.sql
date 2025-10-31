CREATE TABLE curated_zone_db.aws_test_curated
WITH (
  format = 'PARQUET',
  external_location = 's3://injest-xxxx-data/curated/yyyy/aws_test/',
  write_compression = 'SNAPPY'
) AS
SELECT
    op,
    TRY_CAST(dms_timestamp AS timestamp) AS dms_timestamp,
    vin_1_10,
    county,
    city,
    state,
    CAST(postal_code AS varchar) AS postal_code,
    CAST(model_year AS integer) AS model_year,
    make,
    model,
    electric_vehicle_type,
    clean_alternative_fuel_vehicle_cafv_eligibility,
    CAST(electric_range AS integer) AS electric_range,
    CAST(base_msrp AS decimal(12,2)) AS base_msrp,
    CAST(legislative_district AS integer) AS legislative_district,
    dol_vehicle_id,
    vehicle_location,
    electric_utility,
    CAST(_2020_census_tract AS varchar) AS _2020_census_tract
FROM transformed_zone_db.aws_test_transformed;
