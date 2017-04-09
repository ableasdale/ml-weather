xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";

view:bootstrap(
    <div class="container">
        <h2>Pages currently under development <small class="text-muted">ML-Weather</small></h2>
        {view:navbar(), view:table()}
    </div>
)

(:
for $i in xdmp:filesystem-directory(xdmp:modules-root())
return $i
:)

(: DEBUG 
            <textarea>
                {
                    for $i in xdmp:filesystem-directory(xdmp:modules-root())
                    return $i}
            </textarea>
:)