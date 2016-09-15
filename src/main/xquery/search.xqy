xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

declare variable $term as xs:string := xdmp:get-request-field("term", "");


declare function local:get-country-info-from-country-code($code as xs:string) {
    cts:search(collection("country-info"),  cts:element-value-query(xs:QName("alpha-2"), $code))
};

declare function local:do-search() {
    element h2 {"here are some results for", element span {attribute class {"muted-text"}, $term}},
    for $i in cts:search(doc(), cts:element-word-query(xs:QName("name"), $term))
    return 
    (<div class="media">
        <a class="media-left" href="#">
            <img class="media-object" src="{view:preview-lat-long($i/city/latitude, $i/city/longitude)}" alt="Generic placeholder image"/>
        </a>
        <div class="media-body">
            <h4 class="media-heading">{$i/city/name}</h4>
            <ul>
                <li>{$i/city/id}</li>
                <li>{$i/city/country-code}</li>
                <li>{local:get-country-info-from-country-code($i/city/country-code)}</li>
            </ul>
        </div>
    </div>,
    <hr />)
    (:)
    element div {
        attribute class {"row"},
            
    }:)
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
http://static-maps.yandex.ru/1.x/?lang=en-US&ll=-4.274710,37.444199&z=13&l=map&size=300,300&pt=-4.274710,37.444199,pm2rdm1
http://static-maps.yandex.ru/1.x/?lang=en-US&ll=-4.274710,37.444199&z=13&l=map&size=300,300&pt=-4.274710,37.444199,pm2rdm
:)

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