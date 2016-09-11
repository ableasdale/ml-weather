xquery version "1.0-ml";

(:~
: User: ableasdale
: Date: 11/09/16
: Time: 08:32
: To change this template use File | Settings | File Templates.
:)

module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy";

declare variable $OPEN-WEATHERMAP-API-BASE-URI as xs:string := "http://api.openweathermap.org/data/2.5/forecast";
declare variable $OPEN-WEATHERMAP-API-KEY as xs:string := "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";

(:xdmp:http-get("http://api.openweathermap.org/data/2.5/forecast/city?id="||$CITY-ID||"&amp;APPID="||$API-KEY||"&amp;mode=xml") :)