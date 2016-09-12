xquery version "1.0-ml";


import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

view:bootstrap(
    <div class="container">
        <h2>Google Maps <small>Test</small></h2>
        <div id="map" style=" border: 1px solid;padding:3px;width:640px; height:480px;">{" "}</div>    
    </div>)