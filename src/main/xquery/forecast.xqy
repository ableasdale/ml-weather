xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

(: TODO - use session field if nothing is passed in :)
declare variable $id as xs:string := xdmp:get-request-field("id", "");

declare function local:get-forecast($id) {
    element textarea {xdmp:http-get($config:OPEN-WEATHERMAP-API-BASE-URI || "/city?id="||$id||"&amp;APPID="||$config:OPEN-WEATHERMAP-API-KEY||"&amp;mode=xml")}
};

view:bootstrap(
        <div class="container">
            <div class="row">
                <h2>Forecast for <small class="text-muted">{$id}</small></h2>
            </div>
            {view:navbar(), local:get-forecast($id)}
        </div>
)