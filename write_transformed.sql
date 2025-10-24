-- Transformed data written to your transformed zone S3 path

CREATE TABLE transformed_zone_db.aws_test_transformed
WITH (
  format = 'PARQUET',
  external_location = 's3://injest-transformed-data/transformed/dbw3thm2gb6eod/aws_test/',
  write_compression = 'SNAPPY'
) AS
SELECT
  "op" AS op,
  "dms_timestamp" AS dms_timestamp,
  "vin (1-10)" AS vin_1_10,
  "county" AS county,
  "city" AS city,
  "state" AS state,
  "postal code" AS postal_code,
  "model year" AS model_year,
  "make" AS make,
  "model" AS model,
  "electric vehicle type" AS electric_vehicle_type,
  "clean alternative fuel vehicle (cafv) eligibility" AS clean_alternative_fuel_vehicle_cafv_eligibility,
  "electric range" AS electric_range,
  "base msrp" AS base_msrp,
  "legislative district" AS legislative_district,
  "dol vehicle id" AS dol_vehicle_id,
  "vehicle location" AS vehicle_location,
  "electric utility" AS electric_utility,
  "2020 census tract" AS _2020_census_tract
FROM raw_zone_db.aws_test;

