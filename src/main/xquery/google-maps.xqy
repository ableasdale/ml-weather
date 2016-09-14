xquery version "1.0-ml";


import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

view:bootstrap("Google Maps API Example",
    <div class="container">
        <h2>Google Maps <small>API Example</small></h2>
        <div id="map" style=" border: 1px solid;padding:3px;width:640px; height:480px;">{" "}</div>    
    </div>,
    (
      <script async="async" defer="defer" src="https://maps.googleapis.com/maps/api/js?key={$config:GOOGLE-MAPS-API-KEY}&amp;callback=initMap">{" "}</script>,
      <script src="/assets/js/gmaps.js">{" "}</script>
    )
    )