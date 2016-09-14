xquery version "1.0-ml";

(:~
: User: ableasdale
: Date: 11/09/16
: Time: 08:32
: To change this template use File | Settings | File Templates.
:)

module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy";

import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

declare function view:navbar() {
    <div class="row">
        <nav class="navbar navbar-light bg-faded">
            <a class="navbar-brand" href="#">Navbar</a>
            <ul class="nav navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
            </ul>
            <form class="form-inline pull-xs-right search-form" action="/search.xqy" method="post">
                <input name="term" class="form-control suggest-user" type="text" placeholder="Search"/>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </nav>
    </div>
};

declare function view:table() as element(div){
    <div class="row">
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
    </div>
};

declare function view:bootstrap($content as element(div)){
    view:bootstrap($config:APPLICATION-TITLE, $content, ())
};

declare function view:bootstrap($title as xs:string, $content as element(div)){
    view:bootstrap($title, $content, ())
};

declare function view:bootstrap($title as xs:string, $content as element(div), $additional-resource as item()*) {
    xdmp:set-response-content-type("text/html; charset=utf-8"),
    '<!DOCTYPE html>',
    <html lang="en">
        <head>
            <title>{$title}</title>
            <!-- Required meta tags always come first -->
            <meta charset="utf-8"/>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
            <meta http-equiv="x-ua-compatible" content="ie=edge"/>

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/css/bootstrap.min.css" crossorigin="anonymous"/>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.css" crossorigin="anonymous"/>
        </head>
        <body>
            {$content}
            <!-- jQuery first, then Tether, then Bootstrap JS. -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.0.0/jquery.min.js"  crossorigin="anonymous">{" "}</script>
            <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.min.js" integrity="sha256-eGE6blurk5sHj+rmkfsGYeKyZx3M4bG+ZlFyA7Kns7E=" crossorigin="anonymous">{" "}</script>
            <script src="/assets/js/app.js">{" "}</script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.2.0/js/tether.min.js" crossorigin="anonymous">{" "}</script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.4/js/bootstrap.min.js" crossorigin="anonymous">{" "}</script>
            {$additional-resource}
        </body>
    </html>
};