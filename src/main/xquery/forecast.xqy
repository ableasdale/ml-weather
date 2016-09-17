xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

(: TODO - use session field if nothing is passed in :)
declare variable $id as xs:string := xdmp:get-request-field("id", "");

declare function local:get-forecast($id) {
    (: element textarea {xdmp:http-get($config:OPEN-WEATHERMAP-API-BASE-URI || "/city?id="||$id||"&amp;APPID="||$config:OPEN-WEATHERMAP-API-KEY||"&amp;mode=xml")} :)
    element textarea {attribute style {"width:100%"}, fn:doc("/sample.xml")}
};

declare function local:sunrise-sunset() {
    doc("/sample.xml")/weatherdata/sun
};

declare function local:get-forecast-times() {
    doc("/sample.xml")/weatherdata/forecast/time
};


view:bootstrap(
    <div class="container">
        <div class="row">
            <h2>Forecast for <small class="text-muted">{$id}</small></h2>
        </div>
        {view:navbar(),
        for $i in local:get-forecast-times() 
        return 
            element div {attribute class {"row"}, 
                element div {attribute class {"col-sm-3"}, view:render-clock(fn:data($i/@from))},
                element div {attribute class {"col-sm-9"}, "forecast here"}
            }
        }
    </div>
)