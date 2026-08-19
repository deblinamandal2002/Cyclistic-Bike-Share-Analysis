-- ============================================================
-- 5. OVERALL MEMBER VS CASUAL COMPARISON
-- ============================================================

SELECT
    member_type,

    COUNT(*) AS total_rides,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS ride_percentage,

    ROUND(
        AVG(ride_length_minutes),
        2
    ) AS avg_ride_minutes,

    APPROX_QUANTILES(
        ride_length_minutes,
        100
    )[OFFSET(50)] AS median_ride_minutes,

    MIN(ride_length_minutes) AS min_ride_minutes,

    MAX(ride_length_minutes) AS max_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY member_type
ORDER BY total_rides DESC;


-- ============================================================
-- 6. RIDES BY DAY OF WEEK
-- ============================================================

SELECT
    member_type,
    day_of_week,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_minutes), 2) AS avg_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    day_number,
    day_of_week

ORDER BY
    member_type,
    day_number;


-- ============================================================
-- 7. WEEKDAY VS WEEKEND ANALYSIS
-- ============================================================

SELECT
    member_type,
    day_type,

    COUNT(*) AS total_rides,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY member_type
        ),
        2
    ) AS percentage_of_rides,

    ROUND(
        AVG(ride_length_minutes),
        2
    ) AS avg_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    day_type

ORDER BY
    member_type,
    day_type;


-- ============================================================
-- 8. MONTHLY TREND
-- ============================================================

SELECT
    member_type,
    month_number,
    month,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_minutes), 2) AS avg_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    month_number,
    month

ORDER BY
    member_type,
    month_number;


-- ============================================================
-- 9. HOURLY USAGE
-- ============================================================

SELECT
    member_type,
    hour,

    COUNT(*) AS total_rides,

    ROUND(
        AVG(ride_length_minutes),
        2
    ) AS avg_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    hour

ORDER BY
    member_type,
    hour;


-- ============================================================
-- 10. PEAK RIDING HOURS
-- ============================================================

SELECT
    member_type,
    hour,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    hour

ORDER BY
    member_type,
    total_rides DESC;


-- ============================================================
-- 11. BIKE TYPE ANALYSIS
-- ============================================================

SELECT
    member_type,
    rideable_type,

    COUNT(*) AS total_rides,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (
            PARTITION BY member_type
        ),
        2
    ) AS percentage_of_rides,

    ROUND(
        AVG(ride_length_minutes),
        2
    ) AS avg_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    rideable_type

ORDER BY
    member_type,
    total_rides DESC;
