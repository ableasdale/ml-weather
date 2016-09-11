xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

view:bootstrap(
        <div class="container">
            <h2>Title</h2>
            {view:navbar(), view:table()}
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