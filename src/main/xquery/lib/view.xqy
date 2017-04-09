xquery version "1.0-ml";

(:~
: User: ableasdale
: Date: 11/09/16
: Time: 08:32
: To change this template use File | Settings | File Templates.
:)

module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy";

import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

declare namespace xdmp = "http://marklogic.com/xdmp";
declare namespace cts = "http://marklogic.com/cts";

declare function view:render-clock($dateTime as xs:dateTime) as element(svg) {
    <svg class="clock" viewBox="0 0 100 100" dateTime="{$dateTime}">
        <circle class="face" cx="50" cy="50" r="20" fill="white" />
        <g>
            <rect class="hour" x="49.5" y="37.5" width="1" height="15" />
            <rect class="min" x="49.5" y="32.5" width="0.8" height="20" />
        </g>
    </svg>
};

(: See: http://staticmapmaker.com/ :)
declare function view:preview-lat-long($lat as xs:double, $long as xs:double) as xs:string {
    let $coords := fn:string-join((xs:string($long),xs:string($lat)),",")
    return "http://static-maps.yandex.ru/1.x/?lang="||$config:DEFAULT-LANGUAGE||"&amp;ll="||$coords||"&amp;z="||$config:DEFAULT-ZOOM-LEVEL||"&amp;l=map&amp;size="||$config:DEFAULT-THUMBNAIL-DIMENSIONS||"&amp;pt="||$coords||",pm2rdm"
};

declare function view:navbar() as element(nav) {
   (: <!-- <div class="row">
        <div class="container">
            <nav class="navbar navbar-light bg-faded">
                <a class="navbar-brand" href="#">Nav</a>
                <ul class="nav navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">TMP</a>
                    </li>
                </ul>
                <form class="form-inline pull-xs-right search-form" action="/search.xqy" method="post">
                    <input name="term" class="form-control suggest-user" type="text" placeholder="Search"/>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>
            </nav>
        </div>
    </div> --> :)
<nav class="navbar navbar-toggleable-md navbar-light bg-faded">
  <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <a class="navbar-brand" href="#">Navbar</a>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#">Disabled</a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0" action="/search.xqy" method="post">
      <input name="term" class="form-control mr-sm-2" type="text" placeholder="Search"/>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit"><i class="fa fa-search fa-fw">{" "}</i> Search</button>
    </form>
  </div>
</nav>
};

declare function view:table() as element(table) {
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>File</th>
                <th>Type</th>
                <th>Length</th>
                <th>Last Modified</th>
            </tr>
        </thead>
        <tbody>
            {for $i in xdmp:filesystem-directory(xdmp:modules-root())/dir:entry
            return element tr {
                element td {element a {attribute href {"/" || $i/dir:filename}, $i/dir:filename}},
                element td {$i/dir:type},
                element td {$i/dir:content-length},
                element td {$i/dir:last-modified}
            }}
        </tbody>
    </table>
};

declare function view:alert($heading as xs:string, $body as xs:string) as element(div) {
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        <i class="fa fa-warning fa-3x fa-pull-left" aria-hidden="true">{" "}</i>
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <h4 class="alert-heading mb-0">{$heading}</h4>
        <p class="mb-0">{$body}</p>
    </div>
};

declare function view:bootstrap($content as element(div)) as item()+ {
    view:bootstrap($config:APPLICATION-TITLE, $content, ())
};

declare function view:bootstrap($title as xs:string, $content as element(div)) as item()+ {
    view:bootstrap($title, $content, ())
};

declare function view:bootstrap($title as xs:string, $content as element(div), $additional-resource as item()*) as item()+ {
    xdmp:set-response-content-type("text/html; charset=utf-8"),
    '<!DOCTYPE html>',
    <html lang="en">
        <head>
            <title>{$title}</title>
            <!-- Required meta tags always come first -->
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
          
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" crossorigin="anonymous"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" crossorigin="anonymous"/>
            <link rel="stylesheet" href="/assets/font-awesome/css/font-awesome.min.css"/>
            <link rel="stylesheet" href="/assets/css/style.css"/>
            <link rel="stylesheet" href="/assets/css/weather-icons.min.css"/>
            <link rel="stylesheet" href="/assets/css/weather-icons-wind.min.css"/>
        </head>
        <body>
            {$content}
            <!-- jQuery first, then Tether, then Bootstrap JS. -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.slim.min.js"  crossorigin="anonymous">{" "}</script>
            <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" crossorigin="anonymous">{" "}</script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" crossorigin="anonymous">{" "}</script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" crossorigin="anonymous">{" "}</script>
            <script src="/assets/js/app.js">{" "}</script>
            {$additional-resource}
        </body>
    </html>
};