# System Architecture

## Workflow

1. **Employee CSV** — Contains sample employee records.
2. **Hadoop HDFS** — Stores the input data.
3. **Apache Hive** — Queries employee records and calculates department-wise employee counts and average salaries.
4. **Apache Azkaban** — Orchestrates the command job that invokes the Hive SQL script.
5. **Department Analytics** — Represents the aggregated query output.

## Component Responsibilities

| Component | Responsibility |
|---|---|
| HDFS | Data storage |
| Hive | SQL processing |
| Azkaban | Workflow orchestration |

## Execution Status

The Hive aggregation query was manually verified. The Azkaban flow was submitted for execution, but successful end-to-end completion has not been confirmed.
