# Apache Azkaban + Hive Workflow Orchestration

A hands-on Big Data workflow orchestration project using **Apache Azkaban**, **Apache Hive**, and **Hadoop HDFS** to process employee data and generate department-wise salary analytics.

## Project Overview

In a Big Data environment, writing a SQL query is only one part of the solution. Data engineering workflows also need a way to organize and execute processing jobs.

This project demonstrates how Apache Azkaban can orchestrate a Hive SQL job that analyzes employee records stored in HDFS.

### Project Goals

- Store employee data in Hadoop HDFS.
- Query structured data through a Hive external table.
- Calculate department-wise employee counts and average salaries.
- Define a command job using Azkaban job properties.
- Package the workflow files into an Azkaban project.

## Architecture

```text
Employee CSV
     |
     v
Hadoop HDFS
     |
     v
Apache Hive External Table
     |
     v
Hive SQL Aggregation
     |
     v
Azkaban Command Job
     |
     v
Department-wise Analytics
```

**Orchestration concept:** The `.job` file defines the command that Azkaban executes, while the `.hql` file contains the SQL logic used by Hive.

## Technology Stack

| Technology | Purpose |
|---|---|
| Apache Azkaban 3.91.0 | Workflow orchestration |
| Apache Hadoop 3.3.6 | Distributed storage with HDFS |
| Apache Hive 3.1.3 | SQL-based data processing |
| Java 8 | Runtime environment |
| HQL | Querying and aggregation |
| Linux / Ubuntu | Development environment |

## Use Case: Department-wise Salary Analytics

The workflow analyzes employee records to calculate:

- Total employees in each department
- Average salary by department

### Hive Query

```sql
SELECT department,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM company_db.employees
GROUP BY department;
```

### Illustrative Output

The following is an example of the expected result format, not a claim of a new workflow execution.

| Department | Employee Count | Average Salary |
|---|---:|---:|
| Finance | 1 | 41000.00 |
| HR | 2 | 36500.00 |
| IT | 2 | 48500.00 |

## Project Structure

```text
azkaban-hive-workflow/
├── README.md
├── department_summary.hql
└── department_summary.job
```

### `department_summary.hql`

Contains the Hive SQL aggregation query.

### `department_summary.job`

Defines the Azkaban command job:

```properties
type=command
command=/home/akash/Desktop/Akash/hive/bin/hive -f department_summary.hql
```

The command uses the Hive installation path configured in the original development environment. It may need adjustment on another machine.

## Workflow Design

1. Prepare employee data in CSV format.
2. Store the data in HDFS.
3. Define a Hive external table over the HDFS data.
4. Write the department aggregation query in HQL.
5. Configure an Azkaban command job to execute the query.
6. Package and upload the project to Azkaban.
7. Inspect the execution status and logs when running the workflow.

## Key Learning Outcomes

- Understanding the role of workflow orchestration in data engineering
- Connecting HDFS-based storage with Hive SQL processing
- Creating and packaging Azkaban project files
- Understanding command-type jobs and flow nodes
- Distinguishing query logic from job orchestration
- Recognizing the importance of execution logs and resource troubleshooting

## Validation Status

- The Hive aggregation query was executed manually and returned the department-wise results shown above.
- The Azkaban project and its flow were created, uploaded, and submitted for execution.
- End-to-end Azkaban execution remains pending further validation.

## Future Enhancements

- Add additional dependent jobs to demonstrate multi-step orchestration.
- Add data quality checks before aggregation.
- Add a separate output-storage step for analytics results.
- Introduce failure handling and workflow notifications.

---

**Project focus:** Apache Azkaban workflow orchestration with Hadoop HDFS and Hive.

## Project Summary

This project demonstrates the design of a Big Data workflow using Apache Azkaban, Hadoop HDFS, and Apache Hive. It explores how SQL-based data processing can be organized into command jobs and managed through a workflow orchestration tool.

**Key focus areas:** Workflow orchestration, HDFS data management, Hive SQL processing, and job configuration.
