-- ============================================================
-- 12. TOP 10 START STATIONS - MEMBERS
-- ============================================================

SELECT
    start_station_name,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

WHERE
    member_type = 'member'
    AND start_station_name IS NOT NULL

GROUP BY start_station_name

ORDER BY total_rides DESC

LIMIT 10;


-- ============================================================
-- 13. TOP 10 START STATIONS - CASUAL RIDERS
-- ============================================================

SELECT
    start_station_name,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

WHERE
    member_type = 'casual'
    AND start_station_name IS NOT NULL

GROUP BY start_station_name

ORDER BY total_rides DESC

LIMIT 10;


-- ============================================================
-- 14. MOST POPULAR END STATIONS
-- ============================================================

SELECT
    member_type,
    end_station_name,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

WHERE end_station_name IS NOT NULL

GROUP BY
    member_type,
    end_station_name

ORDER BY
    member_type,
    total_rides DESC;


-- ============================================================
-- 15. MOST POPULAR ROUTES
-- ============================================================

SELECT
    member_type,
    start_station_name,
    end_station_name,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

WHERE
    start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL

GROUP BY
    member_type,
    start_station_name,
    end_station_name

ORDER BY
    member_type,
    total_rides DESC;


-- ============================================================
-- 16. TOP 10 CASUAL-RIDER ROUTES
-- ============================================================

SELECT
    start_station_name,
    end_station_name,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

WHERE
    member_type = 'casual'
    AND start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL

GROUP BY
    start_station_name,
    end_station_name

ORDER BY total_rides DESC

LIMIT 10;


-- ============================================================
-- 17. TOP 10 MEMBER ROUTES
-- ============================================================

SELECT
    start_station_name,
    end_station_name,
    COUNT(*) AS total_rides

FROM `project.dataset.analysis_trips`

WHERE
    member_type = 'member'
    AND start_station_name IS NOT NULL
    AND end_station_name IS NOT NULL

GROUP BY
    start_station_name,
    end_station_name

ORDER BY total_rides DESC

LIMIT 10;


-- ============================================================
-- 18. CASUAL-HEAVY START STATIONS
--    Useful for identifying marketing opportunities
-- ============================================================

SELECT
    start_station_name,

    COUNTIF(member_type = 'casual') AS casual_rides,

    COUNTIF(member_type = 'member') AS member_rides,

    COUNT(*) AS total_rides,

    ROUND(
        COUNTIF(member_type = 'casual') * 100.0 /
        COUNT(*),
        2
    ) AS casual_percentage

FROM `project.dataset.analysis_trips`

WHERE start_station_name IS NOT NULL

GROUP BY start_station_name

HAVING COUNT(*) >= 100

ORDER BY casual_percentage DESC;


-- ============================================================
-- 19. MEMBER VS CASUAL BY HOUR AND DAY TYPE
--    Useful for Tableau heatmap
-- ============================================================

SELECT
    member_type,
    day_type,
    hour,
    COUNT(*) AS total_rides,
    ROUND(AVG(ride_length_minutes), 2) AS avg_ride_minutes

FROM `project.dataset.analysis_trips`

GROUP BY
    member_type,
    day_type,
    hour

ORDER BY
    member_type,
    day_type,
    hour;


-- ============================================================
-- 20. EXECUTIVE KPI QUERY
--    Main dataset for Tableau dashboard KPI cards
-- ============================================================

SELECT
    member_type,

    COUNT(*) AS total_rides,

    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS ride_share_percentage,

    ROUND(
        AVG(ride_length_minutes),
        2
    ) AS average_ride_minutes,

    APPROX_QUANTILES(
        ride_length_minutes,
        100
    )[OFFSET(50)] AS median_ride_minutes,

    COUNTIF(day_type = 'Weekend') AS weekend_rides,

    ROUND(
        COUNTIF(day_type = 'Weekend') * 100.0 /
        COUNT(*),
        2
    ) AS weekend_ride_percentage,

    COUNTIF(day_type = 'Weekday') AS weekday_rides,

    ROUND(
        COUNTIF(day_type = 'Weekday') * 100.0 /
        COUNT(*),
        2
    ) AS weekday_ride_percentage

FROM `project.dataset.analysis_trips`

GROUP BY member_type;
