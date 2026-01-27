/**
 * @id debug/sql-sink-check
 * @kind problem
 * @problem.severity recommendation
 */

// Modeling: Query to verify that Django’s cursor.execute is recognized as a SqlExecution sink

import python
import semmle.python.Concepts // gives us SqlExecution

// Debugging Query for SqlExecution
from SqlExecution exec
select exec,
  "This is a SQL execution sink. Argument carrying SQL: " + exec.getSql().toString()
