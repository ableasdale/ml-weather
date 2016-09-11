xquery version "1.0-ml";

(:~
: User: ableasdale
: Date: 11/09/16
: Time: 09:30
: To change this template use File | Settings | File Templates.
:)

declare variable $miles-radius as xs:double := xdmp:get-request-field("radius", "10") cast as xs:double;
declare variable $query := xdmp:get-request-field("id", "3173131");

declare variable $doc :=
    cts:search(
            doc(),
            cts:element-value-query(
                    xs:QName("id"),
                    $query,
                    ("case-insensitive", "whitespace-insensitive")
            )
    );

let $point := cts:point($doc/city/latitude/text(), $doc/city/longitude/text())
let $circle := cts:circle($miles-radius, $point)
let $docs := cts:search(doc(), cts:element-pair-geospatial-query(xs:QName("city"), xs:QName("latitude"), xs:QName("longitude"), $circle))
return $docs