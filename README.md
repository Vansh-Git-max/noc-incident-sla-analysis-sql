# 🖥️ NOC Incident & SLA Analysis Using SQL

A MySQL portfolio project analyzing Network Operations Center (NOC) incidents, SLA compliance, technician workload, resolution performance, and operational trends.

---

## 📌 Project Overview

This project simulates a **Network Operations Center (NOC)** incident management environment using a relational MySQL database.

The project was designed to demonstrate how SQL can be used to analyze operational incident data and answer practical NOC questions such as:

- Which incident categories occur most frequently?
- Which locations have the most Critical incidents?
- How many incidents remain unresolved?
- Which technicians are handling the highest workload?
- How long do different incident categories take to resolve?
- Which incidents breached their SLA?
- What is the overall SLA compliance rate?
- How does SLA performance vary by priority and technician?

---

## 🗄️ Database Structure

The project uses three related tables:

### `technicians`

Stores information about NOC technicians.

Fields include:

- `technician_id`
- `technician_name`
- `location`
- `shift`

### `incidents`

Stores NOC incident records.

Fields include:

- `incident_id`
- `issue`
- `category`
- `priority`
- `status`
- `location`
- `technician_id`
- `created_at`
- `resolved_at`

### `sla_targets`

Stores simulated SLA resolution targets for each priority level.

| Priority | SLA Target |
|---|---:|
| Critical | 60 minutes |
| High | 120 minutes |
| Medium | 240 minutes |
| Low | 480 minutes |

---

## 📊 Dataset

The simulated dataset contains:

- **30 incidents**
- **7 technicians**
- Multiple NOC locations
- Five incident categories
- Four priority levels
- Resolved and unresolved incidents
- Priority-based SLA targets

The dataset was created specifically for portfolio and SQL practice purposes.

---

## 🔍 Analysis Performed

### Incident Analysis

SQL queries were used to analyze:

- Incidents by status
- Incidents by priority
- Critical incidents by location
- Incidents by category
- Unresolved incident backlog

### Technician Analysis

The project analyzes:

- Technician workload
- Unresolved workload by technician
- SLA compliance by technician

### Resolution Analysis

Resolution performance was analyzed using MySQL's:

`TIMESTAMPDIFF()`

to calculate the time between incident creation and resolution.

### SLA Analysis

Each resolved incident was compared against the SLA target associated with its priority.

A `CASE` expression was used to classify incidents as:

- `SLA Met`
- `SLA Breached`

---

## 📈 Key Findings

### Overall SLA Performance

**Overall SLA Compliance: 55.56%**

This means approximately 55.56% of resolved incidents in the simulated dataset were resolved within their assigned priority-based SLA.

### Incident Categories

| Category | Incidents | Share |
|---|---:|---:|
| Network | 12 | 40.00% |
| Server | 8 | 26.67% |
| Security | 6 | 20.00% |
| Hardware | 3 | 10.00% |
| Software | 1 | 3.33% |

**Network incidents represented 40% of all incidents**, making Network the largest incident category.

### Average Resolution Time by Category

| Category | Avg. Resolution Time |
|---|---:|
| Hardware | 210.00 min |
| Server | 202.00 min |
| Software | 165.00 min |
| Network | 97.14 min |
| Security | 70.00 min |

Hardware and Server incidents had the highest average resolution times in the dataset.

### Technician SLA Performance

| Technician | Resolved | SLA Met | SLA Breached | Compliance |
|---|---:|---:|---:|---:|
| Karan Joshi | 2 | 2 | 0 | 100% |
| Neha Verma | 2 | 2 | 0 | 100% |
| Ayesha Khan | 3 | 2 | 1 | 66.67% |
| Vikram Singh | 2 | 1 | 1 | 50.00% |
| Arjun Mehta | 3 | 1 | 2 | 33.33% |
| Sneha Patil | 3 | 1 | 2 | 33.33% |
| Rohit Sharma | 3 | 1 | 2 | 33.33% |

Karan Joshi and Neha Verma had the **highest observed SLA compliance** among technicians in this sample.

Because they handled only two resolved incidents each and incident complexity varies, these results should not be interpreted as a definitive technician performance ranking.

### Critical Backlog

The analysis identified **3 unresolved Critical incidents** requiring operational attention.

---

## 💻 SQL Concepts Demonstrated

This project demonstrates practical use of:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `ROUND()`
- `INNER JOIN`
- `LEFT JOIN`
- `CASE`
- `TIMESTAMPDIFF()`
- `IS NULL`
- Conditional aggregation
- Subqueries
- Foreign keys
- Relational database design

---

## 🧠 Example — SLA Classification

```sql
SELECT
    i.incident_id,
    i.issue,
    i.priority,
    s.target_minutes,
    TIMESTAMPDIFF(
        MINUTE,
        i.created_at,
        i.resolved_at
    ) AS resolution_minutes,

    CASE
        WHEN TIMESTAMPDIFF(
            MINUTE,
            i.created_at,
            i.resolved_at
        ) <= s.target_minutes
        THEN 'SLA Met'
        ELSE 'SLA Breached'
    END AS sla_status

FROM incidents i

INNER JOIN sla_targets s
    ON i.priority = s.priority

WHERE i.resolved_at IS NOT NULL;
```

---

## 🚨 Example — SLA Compliance KPI

```sql
SELECT
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN TIMESTAMPDIFF(
                    MINUTE,
                    i.created_at,
                    i.resolved_at
                ) <= s.target_minutes
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS sla_compliance_percentage

FROM incidents i

INNER JOIN sla_targets s
    ON i.priority = s.priority

WHERE i.resolved_at IS NOT NULL;
```

---

## 🛠️ Tools & Technologies

- **MySQL**
- **MySQL Workbench**
- SQL
- Relational Database Design
- Data Analysis
- NOC Incident Analysis
- SLA Performance Analysis

---

## 🎯 Skills Demonstrated

- SQL Data Analysis
- MySQL
- JOIN Operations
- Aggregate Functions
- Conditional Logic
- Subqueries
- NOC Incident Management
- SLA Monitoring
- Technician Workload Analysis
- Operational KPI Analysis
- IT Operations Analysis

---

## 📁 Project File

`noc_incident_sla_analysis.sql`

The SQL file contains:

1. Database creation
2. Table creation
3. Sample dataset
4. Relationships and SLA targets
5. Incident analysis queries
6. Technician workload queries
7. Resolution-time analysis
8. SLA breach analysis
9. SLA compliance calculations
10. Operational summary queries

---

## 🚀 How to Run

1. Install **MySQL Server** and **MySQL Workbench**
2. Open MySQL Workbench
3. Open `noc_incident_sla_analysis.sql`
4. Execute the database and table creation statements
5. Insert the sample dataset
6. Execute the analysis queries
7. Review the results in the MySQL Workbench Result Grid

---

## 📚 What I Learned

Through this project, I gained hands-on experience with:

- Designing relational tables for operational data
- Connecting related tables using foreign keys
- Joining incident, technician, and SLA data
- Calculating incident resolution times
- Using conditional SQL logic for SLA classification
- Measuring SLA compliance
- Analyzing unresolved incident backlogs
- Comparing technician workloads
- Converting raw incident records into operational insights

---

## 🎯 Project Purpose

This project was created as part of my practical portfolio development for opportunities in:

- **NOC Analyst**
- **Network Support**
- **IT Support**
- **Technical Support**
- **IT Operations**

It demonstrates how SQL can be used to investigate NOC incident data and convert operational records into measurable insights.

---

## 👤 Author

**Vansh**

Building hands-on projects in **NOC Operations, Networking, IT Support, SQL, Power BI, and Data Analytics**.
