xquery version "1.0-ml";

declare variable $term as xs:string := xdmp:get-request-field("term");

array-node {
  for $i in cts:element-value-match(xs:QName("name"), "*"||$term||"*", ("limit=10")) (: cts:element-values(xs:QName("name"), $term, ("limit=10")) :)
  return object-node {"id": $i, "value": $i}
}