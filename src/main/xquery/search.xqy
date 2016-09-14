xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

declare variable $term as xs:string := xdmp:get-request-field("term", "");

view:bootstrap(
        <div class="container">
            <div class="row">
                <h2>Search <small class="text-muted">{$term}</small></h2>
            </div>
            {view:navbar()}
        </div>
)
