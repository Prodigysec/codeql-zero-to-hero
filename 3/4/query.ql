/**
 * @id codeql-zero-to-hero/3-4
 * @severity error
 * @kind problem
 */
import python
import semmle.python.ApiGraphs

from API::CallNode node
where node = API::moduleImport("django").getMember("db").getMember("connection").getMember("cursor").getReturn().getMember("execute").getACall()
select node, "The node has type " + node.getAQlClass() // getAQlClass: debugging tool that gets the name of a most specific QL class of which the receiver of this call is an instance.
