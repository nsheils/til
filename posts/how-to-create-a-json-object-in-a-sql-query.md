---
title: "How to create a json object in a SQL query"
date: "2024-09-25T09:55:07-0500"
tags: [SQL, JSON, google-bigquery]
summary: ""
---

It's possible to create JSON objects from a table in SQL. For example, given a
table with columns `colA`, `colB`, `colC` if I wanted to create a new table with
columns `id` and `json_object` where the values in the `json_object` column were
`{'mycolA': value_from_colA, 'mycolB': value_from_colB}` the appropriate SQL
query would be

```sql

SELECT colC as id,
ARRAY_AGG(JSON_OBJECT('mycolA', colA, 'mycolB', colB)) AS json_object
FROM `my_project.my_table.this_cool_table`

```
