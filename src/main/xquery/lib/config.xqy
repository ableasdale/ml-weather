xquery version "1.0-ml";

(:~
: User: ableasdale
: Date: 11/09/16
: Time: 08:32
: To change this template use File | Settings | File Templates.
:)

module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy";

declare variable $OPEN-WEATHERMAP-API-BASE-URI as xs:string := "http://api.openweathermap.org/data/2.5/forecast";
declare variable $OPEN-WEATHERMAP-API-KEY as xs:string := "097f318ec57e4419962d72214bf49629";
declare variable $GOOGLE-MAPS-API-KEY as xs:string := "AIzaSyDtE2PYRGDifnsVPMO6-lcf8WcrNmnWKOI";
declare variable $APPLICATION-TITLE as xs:string := "MarkLogic Weather Application";
declare variable $DEFAULT-ZOOM-LEVEL as xs:integer := 9;
declare variable $DEFAULT-THUMBNAIL-DIMENSIONS as xs:string := "250,250";
declare variable $DEFAULT-LANGUAGE as xs:string := "en-GB";

(:xdmp:http-get("http://api.openweathermap.org/data/2.5/forecast/city?id="||$CITY-ID||"&amp;APPID="||$API-KEY||"&amp;mode=xml") :)