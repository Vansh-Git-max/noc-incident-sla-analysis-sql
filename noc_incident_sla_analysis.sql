-- CREATE DATABASE noc_sql_project;
-- USE noc_sql_project;

-- CREATE TABLE technicians (
--     technician_id INT PRIMARY KEY,
--     technician_name VARCHAR(100),
--     location VARCHAR(50),
--     shift VARCHAR(20)
-- );

-- CREATE TABLE incidents (
--     incident_id INT PRIMARY KEY,
--     issue VARCHAR(150),
--     category VARCHAR(50),
--     priority VARCHAR(20),
--     status VARCHAR(30),
--     location VARCHAR(50),
--     technician_id INT,
--     created_at DATETIME,
--     resolved_at DATETIME,
--     FOREIGN KEY (technician_id)
--         REFERENCES technicians(technician_id)
-- );

-- CREATE TABLE sla_targets (
--     priority VARCHAR(20) PRIMARY KEY,
--     target_minutes INT
-- );

-- INSERT INTO technicians
-- (technician_id, technician_name, location, shift)
-- VALUES
-- (1, 'Arjun Mehta', 'Mumbai', 'Morning'),
-- (2, 'Sneha Patil', 'Pune', 'Morning'),
-- (3, 'Rohit Sharma', 'Nagpur', 'Evening'),
-- (4, 'Ayesha Khan', 'Mumbai', 'Evening'),
-- (5, 'Karan Joshi', 'Pune', 'Night'),
-- (6, 'Neha Verma', 'Nagpur', 'Night'),
-- (7, 'Vikram Singh', 'Delhi', 'Morning');

-- INSERT INTO sla_targets
-- (priority, target_minutes)
-- VALUES
-- ('Critical', 60),
-- ('High', 120),
-- ('Medium', 240),
-- ('Low', 480);

-- SELECT * FROM technicians;

-- SELECT * FROM sla_targets;

-- INSERT INTO incidents
-- (
--     incident_id,
--     issue,
--     category,
--     priority,
--     status,
--     location,
--     technician_id,
--     created_at,
--     resolved_at
-- )
-- VALUES
-- (1001, 'Core router packet loss', 'Network', 'Critical', 'Resolved', 'Mumbai', 1, '2026-08-24 09:15:00', '2026-08-24 10:05:00'),
-- (1002, 'Email server unavailable', 'Server', 'High', 'Resolved', 'Pune', 2, '2026-08-24 10:30:00', '2026-08-24 12:40:00'),
-- (1003, 'Firewall rule blocking application', 'Security', 'High', 'Resolved', 'Nagpur', 3, '2026-08-24 11:10:00', '2026-08-24 12:20:00'),
-- (1004, 'Branch internet outage', 'Network', 'Critical', 'Resolved', 'Pune', 2, '2026-08-25 08:45:00', '2026-08-25 10:10:00'),
-- (1005, 'High CPU usage on web server', 'Server', 'Medium', 'Resolved', 'Mumbai', 4, '2026-08-25 13:00:00', '2026-08-25 16:10:00'),
-- (1006, 'VPN authentication failure', 'Network', 'High', 'Resolved', 'Delhi', 7, '2026-08-26 09:20:00', '2026-08-26 11:05:00'),
-- (1007, 'Switch interface down', 'Network', 'Critical', 'Resolved', 'Nagpur', 3, '2026-08-26 14:10:00', '2026-08-26 15:25:00'),
-- (1008, 'Endpoint malware alert', 'Security', 'Critical', 'Resolved', 'Mumbai', 4, '2026-08-27 07:50:00', '2026-08-27 08:40:00'),
-- (1009, 'Database response slow', 'Server', 'Medium', 'Resolved', 'Pune', 5, '2026-08-27 12:15:00', '2026-08-27 15:25:00'),
-- (1010, 'Printer unavailable on network', 'Hardware', 'Low', 'Resolved', 'Nagpur', 6, '2026-08-27 15:30:00', '2026-08-27 19:40:00'),
-- (1011, 'DNS resolution failure', 'Network', 'High', 'Resolved', 'Mumbai', 1, '2026-08-28 08:05:00', '2026-08-28 11:00:00'),
-- (1012, 'Storage capacity alert', 'Server', 'Medium', 'Resolved', 'Pune', 5, '2026-08-28 10:40:00', '2026-08-28 14:20:00'),
-- (1013, 'Unauthorized login attempts', 'Security', 'Critical', 'Resolved', 'Delhi', 7, '2026-08-28 18:15:00', '2026-08-28 19:45:00'),
-- (1014, 'Wireless access point offline', 'Network', 'Medium', 'Resolved', 'Nagpur', 6, '2026-08-29 09:00:00', '2026-08-29 11:30:00'),
-- (1015, 'Application service crash', 'Software', 'High', 'Resolved', 'Mumbai', 4, '2026-08-29 10:15:00', '2026-08-29 13:00:00'),
-- (1016, 'Backbone latency spike', 'Network', 'Critical', 'Resolved', 'Pune', 2, '2026-08-29 11:00:00', '2026-08-29 11:40:00'),
-- (1017, 'Disk failure warning', 'Hardware', 'High', 'Resolved', 'Nagpur', 3, '2026-08-29 13:30:00', '2026-08-29 16:20:00'),
-- (1018, 'Backup job failed', 'Server', 'Medium', 'Resolved', 'Mumbai', 1, '2026-08-30 01:20:00', '2026-08-30 06:00:00'),
-- (1019, 'Packet drops on WAN link', 'Network', 'High', 'Open', 'Pune', 5, '2026-08-30 09:45:00', NULL),
-- (1020, 'Antivirus definitions outdated', 'Security', 'Low', 'Open', 'Nagpur', 6, '2026-08-30 14:00:00', NULL),
-- (1021, 'Web server memory alert', 'Server', 'Medium', 'In Progress', 'Mumbai', 4, '2026-08-31 08:30:00', NULL),
-- (1022, 'BGP neighbor down', 'Network', 'Critical', 'Open', 'Delhi', 7, '2026-08-31 09:10:00', NULL),
-- (1023, 'User unable to access VPN', 'Network', 'Medium', 'In Progress', 'Nagpur', 3, '2026-08-31 10:20:00', NULL),
-- (1024, 'Database backup delay', 'Server', 'High', 'Open', 'Pune', 2, '2026-09-01 07:55:00', NULL),
-- (1025, 'Firewall CPU utilization high', 'Security', 'Critical', 'In Progress', 'Mumbai', 1, '2026-09-01 11:45:00', NULL),
-- (1026, 'Network printer queue stuck', 'Hardware', 'Low', 'Open', 'Nagpur', 6, '2026-09-01 13:10:00', NULL),
-- (1027, 'Load balancer health check failed', 'Network', 'High', 'In Progress', 'Mumbai', 4, '2026-09-02 08:15:00', NULL),
-- (1028, 'Server patching pending', 'Server', 'Low', 'Open', 'Pune', 5, '2026-09-02 09:40:00', NULL),
-- (1029, 'Switch port flapping', 'Network', 'Medium', 'Open', 'Nagpur', 3, '2026-09-02 12:00:00', NULL),
-- (1030, 'Suspicious outbound traffic', 'Security', 'Critical', 'In Progress', 'Delhi', 7, '2026-09-02 15:25:00', NULL);

-- SELECT COUNT(*) AS total_incidents
-- FROM incidents;

-- SELECT *
-- FROM incidents
-- ORDER BY incident_id;

-- SELECT status, COUNT(*) AS total_incidents
-- FROM incidents
-- GROUP BY status
-- ORDER BY total_incidents DESC;

-- SELECT priority, COUNT(*) AS total_incidents
-- FROM incidents
-- GROUP BY priority
-- ORDER BY total_incidents DESC;

-- SELECT location, COUNT(*) AS critical_incidents
-- FROM incidents
-- WHERE priority = 'Critical'
-- GROUP BY location
-- ORDER BY critical_incidents DESC;

-- SELECT
--     t.technician_name,
--     COUNT(i.incident_id) AS incidents_handled
-- FROM technicians t
-- LEFT JOIN incidents i
--     ON t.technician_id = i.technician_id
-- GROUP BY t.technician_id, t.technician_name
-- ORDER BY incidents_handled DESC;


-- SELECT
--     category,
--     ROUND(
--         AVG(TIMESTAMPDIFF(MINUTE, created_at, resolved_at)),
--         2
--     ) AS avg_resolution_minutes
-- FROM incidents
-- WHERE resolved_at IS NOT NULL
-- GROUP BY category
-- ORDER BY avg_resolution_minutes DESC;

-- SELECT
--     i.incident_id,
--     i.issue,
--     i.priority,
--     s.target_minutes,
--     TIMESTAMPDIFF(
--         MINUTE,
--         i.created_at,
--         i.resolved_at
--     ) AS resolution_minutes,
--     CASE
--         WHEN TIMESTAMPDIFF(
--             MINUTE,
--             i.created_at,
--             i.resolved_at
--         ) <= s.target_minutes
--         THEN 'SLA Met'
--         ELSE 'SLA Breached'
--     END AS sla_status
-- FROM incidents i
-- INNER JOIN sla_targets s
--     ON i.priority = s.priority
-- WHERE i.resolved_at IS NOT NULL
-- ORDER BY i.incident_id;

-- SELECT
--     CASE
--         WHEN TIMESTAMPDIFF(
--             MINUTE,
--             i.created_at,
--             i.resolved_at
--         ) <= s.target_minutes
--         THEN 'SLA Met'
--         ELSE 'SLA Breached'
--     END AS sla_status,
--     COUNT(*) AS total_incidents
-- FROM incidents i
-- INNER JOIN sla_targets s
--     ON i.priority = s.priority
-- WHERE i.resolved_at IS NOT NULL
-- GROUP BY sla_status;

-- SELECT
--     ROUND(
--         100.0 *
--         SUM(
--             CASE
--                 WHEN TIMESTAMPDIFF(
--                     MINUTE,
--                     i.created_at,
--                     i.resolved_at
--                 ) <= s.target_minutes
--                 THEN 1
--                 ELSE 0
--             END
--         ) / COUNT(*),
--         2
--     ) AS sla_compliance_percentage
-- FROM incidents i
-- INNER JOIN sla_targets s
--     ON i.priority = s.priority
-- WHERE i.resolved_at IS NOT NULL;

-- SELECT
--     i.priority,
--     COUNT(*) AS resolved_incidents,
--     SUM(
--         CASE
--             WHEN TIMESTAMPDIFF(MINUTE, i.created_at, i.resolved_at)
--                  <= s.target_minutes
--             THEN 1 ELSE 0
--         END
--     ) AS sla_met,
--     SUM(
--         CASE
--             WHEN TIMESTAMPDIFF(MINUTE, i.created_at, i.resolved_at)
--                  > s.target_minutes
--             THEN 1 ELSE 0
--         END
--     ) AS sla_breached,
--     ROUND(
--         100.0 * SUM(
--             CASE
--                 WHEN TIMESTAMPDIFF(MINUTE, i.created_at, i.resolved_at)
--                      <= s.target_minutes
--                 THEN 1 ELSE 0
--             END
--         ) / COUNT(*),
--         2
--     ) AS sla_compliance_percentage
-- FROM incidents i
-- JOIN sla_targets s
--     ON i.priority = s.priority
-- WHERE i.resolved_at IS NOT NULL
-- GROUP BY i.priority
-- ORDER BY sla_compliance_percentage ASC;

-- SELECT
--     t.technician_name,
--     COUNT(*) AS resolved_incidents,

--     SUM(
--         CASE
--             WHEN TIMESTAMPDIFF(MINUTE, i.created_at, i.resolved_at)
--                  <= s.target_minutes
--             THEN 1 ELSE 0
--         END
--     ) AS sla_met,

--     SUM(
--         CASE
--             WHEN TIMESTAMPDIFF(MINUTE, i.created_at, i.resolved_at)
--                  > s.target_minutes
--             THEN 1 ELSE 0
--         END
--     ) AS sla_breached,

--     ROUND(
--         100.0 * SUM(
--             CASE
--                 WHEN TIMESTAMPDIFF(MINUTE, i.created_at, i.resolved_at)
--                      <= s.target_minutes
--                 THEN 1 ELSE 0
--             END
--         ) / COUNT(*),
--         2
--     ) AS sla_compliance_percentage

-- FROM incidents i

-- JOIN technicians t
--     ON i.technician_id = t.technician_id

-- JOIN sla_targets s
--     ON i.priority = s.priority

-- WHERE i.resolved_at IS NOT NULL

-- GROUP BY
--     t.technician_id,
--     t.technician_name

-- ORDER BY sla_compliance_percentage DESC;

-- SELECT
--     i.incident_id,
--     i.issue,
--     i.priority,
--     i.status,
--     i.location,
--     t.technician_name,
--     i.created_at
-- FROM incidents i
-- JOIN technicians t
--     ON i.technician_id = t.technician_id
-- WHERE i.priority = 'Critical'
--   AND i.resolved_at IS NULL
-- ORDER BY i.created_at;

-- SELECT
--     t.technician_name,
--     COUNT(i.incident_id) AS unresolved_incidents
-- FROM technicians t
-- LEFT JOIN incidents i
--     ON t.technician_id = i.technician_id
--     AND i.resolved_at IS NULL
-- GROUP BY
--     t.technician_id,
--     t.technician_name
-- ORDER BY unresolved_incidents DESC;

-- SELECT
--     location,
--     priority,
--     COUNT(*) AS unresolved_incidents
-- FROM incidents
-- WHERE resolved_at IS NULL
-- GROUP BY location, priority
-- ORDER BY unresolved_incidents DESC;

-- SELECT
--     COUNT(*) AS total_incidents,

--     SUM(CASE
--         WHEN resolved_at IS NULL THEN 1
--         ELSE 0
--     END) AS unresolved_incidents,

--     SUM(CASE
--         WHEN priority = 'Critical' THEN 1
--         ELSE 0
--     END) AS critical_incidents,

--     SUM(CASE
--         WHEN priority = 'Critical'
--              AND resolved_at IS NULL THEN 1
--         ELSE 0
--     END) AS unresolved_critical_incidents,

--     ROUND(
--         AVG(
--             CASE
--                 WHEN resolved_at IS NOT NULL
--                 THEN TIMESTAMPDIFF(MINUTE, created_at, resolved_at)
--             END
--         ),
--         2
--     ) AS avg_resolution_minutes

-- FROM incidents;
