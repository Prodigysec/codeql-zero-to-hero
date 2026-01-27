/**
 * @id codeql-zero-to-hero/4-4
 * @severity error
 * @kind problem
 */

 import python
 import semmle.python.dataflow.new.RemoteFlowSources


from RemoteFlowSource rfs
select rfs, "All python sources"
