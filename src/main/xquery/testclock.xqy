xquery version "1.0-ml";

(: See here for original code : http://thenewcode.com/943/An-SVG-Analog-Clock-In-6-Lines-of-JavaScript :)

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

view:bootstrap(
        <div class="container">
            <svg id="clock" viewBox="0 0 100 100">
                <circle id="face" cx="50" cy="50" r="20" fill="white" />
                <g>
                    <!-- line id="sec" x1="50" y1="50" x2="50" y2="40" / -->
                    <rect id="hour" x="49.5" y="37.5" width="1" height="15" />
                    <rect id="min" x="49.8" y="32.5" width="0.5" height="20" />
                </g>
            </svg>
        </div>
)