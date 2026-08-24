# Project Architecture

```text
CSV source files
      |
      v
Python / Pandas
  cleaning + validation
      |
      v
Processed analytical data
      |
      +------------------+
      |                  |
      v                  v
     SQL             Power BI
 analysis/model      dashboards
      |                  |
      +--------+---------+
               v
       Business insights
```

A future cloud extension can replace the local CSV landing zone with Amazon S3 and schedule the Python/SQL workflow using AWS services.
