/**
 * @id demo/sql-injection
 * @kind path-problem
 * @problem.severity error
 */

import python
import semmle.python.dataflow.new.DataFlow
import semmle.python.dataflow.new.TaintTracking
import semmle.python.Concepts        // gives us SqlExecution
import semmle.python.ApiGraphs
import semmle.python.dataflow.new.RemoteFlowSources

/**
 * Custom configuration for tracking flows into SQL execution.
 */
private module MyConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    // Treat remote user input as a source (HTTP params, headers, etc.)
    source instanceof RemoteFlowSource
  }

  predicate isSink(DataFlow::Node sink) {
    // Any argument that SqlExecution.getSql() identifies
    exists(SqlExecution exec |
      sink = exec.getSql()
    )
  }
}

module MyFlow = TaintTracking::Global<MyConfig>;

// Report when untrusted input reaches an SQL execution sink.

from MyFlow::PathNode source, MyFlow::PathNode sink
where MyFlow::flowPath(source, sink)
select sink.getNode(), source, sink,
  "Untrusted user input flows into an SQL execution: possible SQL injection."
