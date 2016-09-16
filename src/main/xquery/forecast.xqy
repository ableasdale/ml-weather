xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

(: TODO - use session field if nothing is passed in :)
declare variable $id as xs:string := xdmp:get-request-field("id", "");

declare function local:get-forecast($id) {
    "TODO"
};

view:bootstrap(
        <div class="container">
            <div class="row">
                <h2>Forecast for <small class="text-muted">{$id}</small></h2>
            </div>
            {view:navbar(), local:get-forecast($id)}
        </div>
)