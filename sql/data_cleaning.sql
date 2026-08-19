-- ============================================================
-- 1. COMBINE MONTHLY DATASETS
-- ============================================================

CREATE OR REPLACE TABLE `project.dataset.q1_trips` AS

SELECT * FROM `project.dataset.jan_trips`

UNION ALL

SELECT * FROM `project.dataset.feb_trips`

UNION ALL

SELECT * FROM `project.dataset.mar_trips`;


-- ============================================================
-- 2. DATA VALIDATION
-- ============================================================

-- 2.1 Total records
SELECT
    COUNT(*) AS total_rows
FROM `project.dataset.q1_trips`;


-- 2.2 Check duplicate ride IDs
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT ride_id) AS unique_ride_ids,
    COUNT(*) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `project.dataset.q1_trips`;


-- 2.3 Check NULL values
SELECT
    COUNT(*) AS total_rows,
    COUNTIF(ride_id IS NULL) AS null_ride_id,
    COUNTIF(rideable_type IS NULL) AS null_rideable_type,
    COUNTIF(started_at IS NULL) AS null_started_at,
    COUNTIF(ended_at IS NULL) AS null_ended_at,
    COUNTIF(start_station_name IS NULL) AS null_start_station,
    COUNTIF(end_station_name IS NULL) AS null_end_station,
    COUNTIF(start_station_id IS NULL) AS null_start_station_id,
    COUNTIF(end_station_id IS NULL) AS null_end_station_id,
    COUNTIF(member_casual IS NULL) AS null_member_type
FROM `project.dataset.q1_trips`;


-- 2.4 Check member types
SELECT
    member_casual AS member_type,
    COUNT(*) AS ride_count
FROM `project.dataset.q1_trips`
GROUP BY member_casual
ORDER BY ride_count DESC;


-- 2.5 Check bike types
SELECT
    rideable_type,
    COUNT(*) AS ride_count
FROM `project.dataset.q1_trips`
GROUP BY rideable_type
ORDER BY ride_count DESC;


-- ============================================================
-- 3. CREATE CLEANED DATASET
-- ============================================================

CREATE OR REPLACE TABLE `project.dataset.cleaned_trips` AS

SELECT
    ride_id,
    rideable_type,
    start_station_name,
    end_station_name,
    start_station_id,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual AS member_type,

    started_at,
    ended_at,

    TIMESTAMP_DIFF(
        ended_at,
        started_at,
        MINUTE
    ) AS ride_length_minutes,

    EXTRACT(DAYOFWEEK FROM started_at) AS day_number,

    FORMAT_DATE(
        '%a',
        DATE(started_at)
    ) AS day_of_week,

    EXTRACT(MONTH FROM started_at) AS month_number,

    FORMAT_DATE(
        '%b',
        DATE(started_at)
    ) AS month,

    EXTRACT(DAY FROM started_at) AS day,

    EXTRACT(YEAR FROM started_at) AS year,

    EXTRACT(HOUR FROM started_at) AS hour,

    CASE
        WHEN EXTRACT(DAYOFWEEK FROM started_at) IN (1, 7)
            THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type

FROM `project.dataset.q1_trips`

WHERE
    ride_id IS NOT NULL
    AND started_at IS NOT NULL
    AND ended_at IS NOT NULL
    AND member_casual IS NOT NULL
    AND ended_at > started_at;


-- ============================================================
-- 4. CREATE FINAL ANALYSIS DATASET
--    Remove rides <= 1 minute and >= 24 hours
-- ============================================================

CREATE OR REPLACE TABLE `project.dataset.analysis_trips` AS

SELECT *
FROM `project.dataset.cleaned_trips`

WHERE
    ride_length_minutes > 1
    AND ride_length_minutes < 1440;
