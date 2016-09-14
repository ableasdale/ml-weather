xquery version "1.0-ml";
element search-term {
    xdmp:get-request-field("term")
}