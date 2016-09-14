xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

declare variable $term as xs:string := xdmp:get-request-field("term", "");

declare function local:do-search() {
    "here are some results for "||$term
};

view:bootstrap(
        <div class="container">
            <div class="row">
                <h2>Search <small class="text-muted">{$term}</small></h2>
            </div>
            {view:navbar(), local:do-search()}
        </div>
)


(:
http://maps.googleapis.com/maps/api/staticmap?center=16.854380,74.564171&zoom=8&scale=false&size=300x300&maptype=roadmap&format=png&visual_refresh=true
:)

(: Todo
bing
http://dev.virtualearth.net/REST/V1/Imagery/Map/Road/42.6564%2C-73.7638/13?mapSize=600,300&format=png&key=YOUR-API-KEY-HERE
cartodb
https://cartocdn-ashbu.global.ssl.fastly.net/USER/api/v1/map/static/center/TOKEN/13/42.6564/-73.7638/600/300.png
here
http://image.maps.cit.api.here.com/mia/1.6/mapview?app_id=YOUR-APP-ID-HERE&app_code=YOUR-CODE-ID-HERE&ci=Albany,NY&h=300&w=600&z=13&f=0&style=alps
mapbox
https://api.mapbox.com/v4/mapbox.emerald/-73.7638,42.6564,13/600x300@2x.png?access_token=YOUR-API-KEY-HERE
mapquest
http://www.mapquestapi.com/staticmap/v4/getplacemap?key=YOUR-API-KEY-HERE&location=Albany,+NY&size=600,300&type=map&zoom=13&imagetype=png&scalebar=false
yandex
http://static-maps.yandex.ru/1.x/?lang=en-US&ll=-73.7638,42.6564&z=13&l=map&size=600,300
:)