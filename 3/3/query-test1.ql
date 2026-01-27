import python
import semmle.python.ApiGraphs

select API::moduleImport("flask").getMember("request").getMember("args"),
        API::moduleImport("flask").getMember("request").getMember("args").asSource(), // asSource gets a data-flow node where this value enters the current codebase.
        API::moduleImport("flask").getMember("request").getMember(_).asSource()
