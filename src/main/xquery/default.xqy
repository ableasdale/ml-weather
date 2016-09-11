xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

view:bootstrap(
        <div class="container">
            <h2>Title</h2>
            {view:navbar()}
            <table class="table table-striped">
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
            <textarea>
                {
                    for $i in xdmp:filesystem-directory(xdmp:modules-root())
                    return $i}
            </textarea>
        </div>
)

(:
for $i in xdmp:filesystem-directory(xdmp:modules-root())
return $i
:)