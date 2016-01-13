xquery version "1.0-ml";

module namespace constraint = "http://marklogic.com/constraint/triple-range-constraint";

import module namespace search =
  "http://marklogic.com/appservices/search"
    at "/MarkLogic/appservices/search/search.xqy";

declare function constraint:query(
  $query-elem as element(),
  $options as element(search:options)
) as schema-element(cts:query)
{
  let $subject := $query-elem/search:subject
  let $subject := if (exists($subject))
    then string($subject)
    else ()
  let $predicate := $query-elem/search:predicate
  let $predicate := if (exists($predicate))
    then string($predicate)
    else ()
  let $object := $query-elem/search:object
  let $object := if (exists($object))
    then string($object)
    else ()
  return
    <cts:triple-range-query>
      {
        <x>{cts:triple-range-query(
           sem:iri($subject),
           sem:iri($predicate),
           sem:iri($object)
        )}</x>/*/*
      }
    </cts:triple-range-query>
};
