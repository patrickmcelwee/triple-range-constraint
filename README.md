# triple-range-constraint

## Summary

This module provides a module to easily create a MarkLogic [custom constraint] using a [triple-range-query]. This is helpful when composing a [structured query]. 

Triple range queries return document fragments, and so are helpful for limiting the scope of a search, for example. The use case that inspired this library was to run searches across all documents related to a specific account document. Related documents were marked as related to particular account uris using [embedded triples].

Triple range queries are not available out-of-the-box in a structured query (though they can be specified as an additional-query in your search options). They can be included as a [custom-constraint-query], which calls arbitrary module code.

Using the additional-query search option is the best method in many cases, but may not be feasible if parts of the query are dynamically constructed client-side. In that case, building up a structured query is often the best solution, and this library allows triple-range-queries to be used in such a strategy.

## Installation

TODO: details on mlpm installation

## Use as a custom constraint

Add this to your MarkLogic search options (which can be saved on the server):

```xml
<search:constraint name="triples">
  <search:custom facet="false">
    <search:parse apply="query" ns="http://marklogic.com/constraint/triple-range-constraint" at="/ext/mlpm_modules/triple-range-constraint/triple-range-constraint.xqy"/>
  </search:custom>
</search:constraint>
```

As part of your [structured query], you can now include something like this:

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

## License Information

Copyright (c) 2014 Patrick McElwee. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy of the
License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed
under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
CONDITIONS OF ANY KIND, either express or implied. See the License for the
specific language governing permissions and limitations under the License.

The use of the Apache License does not indicate that this project is affiliated
with the Apache Software Foundation.
