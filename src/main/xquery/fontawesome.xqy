xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";


(: sudo dnf system-upgrade reboot :)

view:bootstrap(
    <div class="container">
        
        <h2>Bootstrap 4 <small class="text-muted">Fontawesome Examples</small></h2>
        {view:navbar()}
       
        <ul class="list-group">
            <li class="list-group-item"><i class="fa fa-home fa-fw">{" "}</i> Home</li>
            <li class="list-group-item"><i class="fa fa-book fa-fw">{" "}</i> Library</li>
            <li class="list-group-item"><i class="fa fa-pencil fa-fw">{" "}</i> Applications</li>
            <li class="list-group-item"><i class="fa fa-cog fa-fw">{" "}</i> Settings</li>
        </ul>

    </div>
)