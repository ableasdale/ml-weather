xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

view:bootstrap(
    <div class="container">
        
        <h2>Bootstrap 4 <small class="text-muted">Fontawesome Examples</small></h2>
        {view:navbar()}

        {view:alert("Information", "You should check in on some of those fields below.")}


        <ul class="list-group">
            <li class="list-group-item"><i class="fa fa-home fa-fw">{" "}</i> Home</li>
            <li class="list-group-item"><i class="fa fa-book fa-fw">{" "}</i> Library</li>
            <li class="list-group-item"><i class="fa fa-pencil fa-fw">{" "}</i> Applications</li>
            <li class="list-group-item"><i class="fa fa-cog fa-fw">{" "}</i> Settings</li>
        </ul>

        <ul class="fa-ul">
            <li><i class="fa-li fa fa-check-square">{" "}</i>List icons</li>
            <li><i class="fa-li fa fa-check-square">{" "}</i>can be used</li>
            <li><i class="fa-li fa fa-spinner fa-spin">{" "}</i>as bullets</li>
            <li><i class="fa-li fa fa-square">{" "}</i>in lists</li>
        </ul>


        <div class="input-group margin-bottom-sm">
        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw">{" "}</i></span>
        <input class="form-control" type="text" placeholder="Email address"/>
        </div>

        <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-key fa-fw">{" "}</i></span>
        <input class="form-control" type="password" placeholder="Password"/>
        </div>

        <div class="btn-group open">
        <a class="btn btn-primary" href="#"><i class="fa fa-user fa-fw">{" "}</i> User</a>
        <a class="btn btn-primary dropdown-toggle" data-toggle="dropdown" href="#">
            <span class="fa fa-caret-down" title="Toggle dropdown menu"></span>
        </a>

        <ul class="dropdown-menu">
            <li><a href="#"><i class="fa fa-pencil fa-fw">{" "}</i> Edit</a></li>
            <li><a href="#"><i class="fa fa-trash-o fa-fw">{" "}</i> Delete</a></li>
            <li><a href="#"><i class="fa fa-ban fa-fw">{" "}</i> Ban</a></li>
            <li class="divider">{" "}</li>
            <li><a href="#"><i class="fa fa-unlock">{" "}</i> Make admin</a></li>
        </ul>
        </div>

        <div class="row">
            <i class="fa fa-quote-left fa-3x fa-pull-left fa-border" aria-hidden="true">{" "}</i>
            <p>Pullquote</p>
        </div>
        <i class="fa fa-refresh fa-spin fa-3x fa-fw">{" "}</i>
        <span class="sr-only">Loading...</span>

    </div>)