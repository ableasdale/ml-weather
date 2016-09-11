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