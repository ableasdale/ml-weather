Very early stages of development right now...

## Setup notes

### Database 

```xquery
xquery version "1.0-ml";

import module namespace info = "http://marklogic.com/appservices/infostudio" at "/MarkLogic/appservices/infostudio/info.xqy";

info:database-create("ML-Weather")
```

### TODO - add geospatial-element-pair-indexes (latitude,longitude)

### Application Server

```xquery
xquery version "1.0-ml";

import module namespace admin = "http://marklogic.com/xdmp/admin" at "/MarkLogic/admin.xqy";

declare variable $DATABASE as xs:string := "ML-Weather";
declare variable $PORT as xs:unsignedLong := 8084;
declare variable $PATH as xs:string := "/ROOT/PATH/TO/ml-weather/src/main/xquery";

declare function local:create-http-application-server() {
  let $config := admin:get-configuration()
  let $config := admin:http-server-create($config, admin:group-get-id($config, "Default"), fn:concat("http-",$PORT),
        $PATH, $PORT, 0, xdmp:database($DATABASE))
(:  let $config := admin:appserver-set-authentication($config,
         admin:appserver-get-id($config, admin:group-get-id($config, "Default"), fn:concat("http-",$PORT)),
         "application-level") :)
  return
  admin:save-configuration($config)
};

local:create-http-application-server()
```

### Early planning: Possible APIs to use

The plan is to use the following APIs to gather weather data:

- http://graphical.weather.gov/xml/SOAP_server/ndfdXML.htm (http://www.programmableweb.com/api/noaa-national-weather-service-nws)
- https://api.met.no/weatherapi/documentation
- https://developer.yahoo.com/weather/
- http://weather.service.msn.com/data.aspx?weasearchstr=ny,NY&culture=en-US&weadegreetype=C&src=msn
- https://developer.forecast.io/ (maybe? it does have cheap pricing??)
- https://www.wunderground.com/weather/api/?MR=1
- http://www.programmableweb.com/category/weather/api (good list of ideas)
- BBC (http://newsrss.bbc.co.uk/weather/forecast/4197/Next3DaysRSS.xml) (http://open.live.bbc.co.uk/weather/feeds/en/2643123/3dayforecast.rss) (http://open.live.bbc.co.uk/weather/feeds/en/2643123/observations.rss)

### Other links
- http://www.oak-wood.co.uk/oss/other/bbcwx
- Standard BBC icons (http://static.bbci.co.uk/weather/0.3.203/images/icons/individual_57_icons/en_on_light_bg/2.gif)

### Acknowledgements
- Country lookup XML from (https://github.com/lukes/ISO-3166-Countries-with-Regional-Codes)
- City ID List original text file from (http://openweathermap.org/help/city_list.txt)
- Weather icons from (https://erikflowers.github.io/weather-icons/)

### TODO
https://mledoze.github.io/countries/
