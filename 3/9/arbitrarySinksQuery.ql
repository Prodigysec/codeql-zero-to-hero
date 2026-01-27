/**
 * @kind problem
 * @problem.severity error
 * @id githubsecuritylab/3-9
 */

import python
import semmle.python.Concepts

from CodeExecution sink
select sink, "Potential code execusion sink"
