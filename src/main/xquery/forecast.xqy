xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

(: TODO - use session field if nothing is passed in :)
declare variable $id as xs:string := xdmp:get-request-field("id", "");
declare variable $data := local:get-forecast($id);

declare function local:get-forecast($id) {
    fn:doc("/sample.xml")
    (: element textarea {xdmp:http-get($config:OPEN-WEATHERMAP-API-BASE-URI || "/city?id="||$id||"&amp;APPID="||$config:OPEN-WEATHERMAP-API-KEY||"&amp;mode=xml")} :)
    (: element textarea {attribute style {"width:100%"}, fn:doc("/sample.xml")} :)
};

declare function local:sunrise-sunset() {
    doc("/sample.xml")/weatherdata/sun
};

declare function local:get-forecast-times() {
    doc("/sample.xml")/weatherdata/forecast/time
};

declare function local:forecast($dateTime as element(time)) {
    <div>
        <h4>{fn:data($dateTime/@from)} to {fn:data($dateTime/@to)}</h4>
        <p>{fn:data($dateTime/symbol/@number)}, {fn:data($dateTime/symbol/@name)}, {fn:data($dateTime/symbol/@var)}</p>
        <p>Wind Direction: {fn:data($dateTime/windDirection/@deg)}, {fn:data($dateTime/windDirection/@name)}, {fn:data($dateTime/windDirection/@code)}</p>
        <h2><i class="wi wi-wind wi-from-{fn:lower-case(fn:data($dateTime/windDirection/@code))}">{" "}</i></h2>
        <img src="http://openweathermap.org/img/w/{fn:data($dateTime/symbol/@var)}.png" />
        <h2><i class="wi wi-owm-{fn:data($dateTime/symbol/@number)}">{" "}</i></h2>
    </div>
};


view:bootstrap(
    <div class="container">
        <div class="row">
            <h2>Forecast for <small class="text-muted">{$id}</small></h2>
        </div>
        {view:navbar()}
        <div class="row">
            <h3>{xs:string($data/weatherdata/location/name)} ({xs:string($data/weatherdata/location/country)})</h3>
            <h3>Sunrise: {fn:data($data/weatherdata/sun/@rise)} Sunset: {fn:data($data/weatherdata/sun/@set)}</h3>
            <h4>Altitude: {fn:data($data/weatherdata/location/location/@altitude)} Latitude: {fn:data($data/weatherdata/location/location/@latitude)} Longitude: {fn:data($data/weatherdata/location/location/@longitude)}</h4>
        </div>
        {
        for $i in local:get-forecast-times()
        return 
            element div {attribute class {"row"}, 
                element div {attribute class {"col-sm-3"}, view:render-clock(fn:data($i/@from))},
                element div {attribute class {"col-sm-9"}, local:forecast($i)}
            }
        }
    </div>
)