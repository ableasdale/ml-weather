xquery version "1.0-ml";

(:~
: User: ableasdale
: Date: 11/09/16
: Time: 08:33
: To change this template use File | Settings | File Templates.
:)

(:
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

$config:OPEN-WEATHERMAP-API-BASE-URI,
$config:OPEN-WEATHERMAP-API-KEY
:)

declare variable $id as xs:string := xdmp:get-request-field("id", "3173131");

cts:search(doc(), cts:element-value-query(xs:QName("id"), $id))