/**
 * @id codeql-zero-to-hero/3-1
 * @severity error
 * @kind problem
 */

//  Query for calls to functions from specific libraries

import python
import semmle.python.ApiGraphs

from API::CallNode node
where node =
API::moduleImport("django").getMember("db").getMember("connection").getMember("cursor").getReturn().getMember("execute").getACall()
and
node.getLocation().getFile().getRelativePath().regexpMatch("2/challenge-1/.*")
select node, "Call to django.db execute"
