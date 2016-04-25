xquery version "1.0-ml";

module namespace constraint = "http://marklogic.com/constraint/triple-range-constraint";

import module namespace search = "http://marklogic.com/appservices/search"
  at "/MarkLogic/appservices/search/search.xqy";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

declare option xdmp:mapping "false";

declare function constraint:query(
  $query-elem as element(),
  $options as element(search:options)
) as schema-element(cts:query)
{
  let $subjects := constraint:get-data($query-elem/search:subject)
  let $predicates := constraint:get-data($query-elem/search:predicate)
  let $objects := constraint:get-data($query-elem/search:object)
  let $operators := constraint:get-data($query-elem/search:operator)

  return document{
    cts:triple-range-query(
      $subjects,
      $predicates,
      $objects,
      $operators
    )
  }/*
};

declare private function constraint:get-data($vals) {
  for $v in $vals
  return
    if (starts-with($v, "<") and ends-with($v, ">")) then
      sem:iri(substring($v, 2, string-length($v) - 2))
    else
      data($v)
};