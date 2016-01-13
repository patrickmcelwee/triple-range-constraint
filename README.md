# triple-range-constraint

## Summary

This module provides a module to easily create a MarkLogic [custom constraint](https://docs.marklogic.com/guide/search-dev/search-api#id_49750) using a [triple-range-query](https://docs.marklogic.com/cts:triple-range-query). This is helpful when composing a [structured query](https://docs.marklogic.com/guide/search-dev/structured-query). 

Triple range queries return document fragments, and so are helpful for limiting the scope of a search, for example. The use case that inspired this library was to run searches across all documents related to a specific account document. Related documents were marked as related to particular account uris using [embedded triples](https://docs.marklogic.com/guide/semantics/embedded).

Triple range queries are not available out-of-the-box in a structured query (though they can be specified as an additional-query in your search options). They can be included as a [custom-constraint-query](https://docs.marklogic.com/guide/search-dev/structured-query#id_28778), which calls arbitrary module code.

Using the additional-query search option is the best method in many cases, but may not be feasible if parts of the query are dynamically constructed client-side. In that case, building up a structured query is often the best solution, and this library allows triple-range-queries to be used in such a strategy.

## Installation

This is an [mlpm](http://registry.demo.marklogic.com/docs#install-mlpm) module. See that page for the latest installation directions. This should work:

    npm install -g mlpm
    mlpm install triple-range-constraint --save
    mlpm deploy -H localhost -P 8040 -u admin -p admin

## Use as a custom constraint

Add this to your MarkLogic search options (which can be saved on the server):

```xml
<search:constraint name="triples">
  <search:custom facet="false">
    <search:parse apply="query" ns="http://marklogic.com/constraint/triple-range-constraint" at="/ext/mlpm_modules/triple-range-constraint/triple-range-constraint.xqy"/>
  </search:custom>
</search:constraint>
```

As part of your [structured query](https://docs.marklogic.com/guide/search-dev/structured-query), you can now include something like this:

```javascript
'custom-constraint-query': {
  'constraint-name': 'triples',
  'predicate': 'http://marklogic.com/relatesTo',
  'object': '/uri/something-I-care-about.json'
}
```

or, in XML:

```xml
<custom-constraint-query>
  <constraint-name>triples</constraint-name>
  <predicate>http://marklogic.com/relatesTo</predicate>
  <object>/uri/something-I-care-about.xml</object>
</custom-constraint-query>
```

Note that subject, predicate, and object are all optional, depending on what kind of triple-range-query you need.
