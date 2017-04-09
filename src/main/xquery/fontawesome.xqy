xquery version "1.0-ml";

import module namespace view = "http://www.xmlmachines.com/ml-weather/view.xqy" at "/lib/view.xqy";
import module namespace config = "http://www.xmlmachines.com/ml-weather/config.xqy" at "/lib/config.xqy";

view:bootstrap(
    <div class="container">
        
        <h2>Bootstrap 4 <small class="text-muted">Fontawesome Examples</small></h2>
        <h4>Example heading <span class="badge badge-default">New</span></h4>
        <h4>Example heading <span class="badge badge-default"><i class="fa fa-home fa-fw">{" "}</i> New</span></h4>

        {view:navbar()}

        {view:alert("Information", "You should check in on some of those fields below.")}

        <div class="card" style="width: 20rem;">
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><i class="fa fa-home fa-fw">{" "}</i> Home</li>
                <li class="list-group-item"><i class="fa fa-book fa-fw">{" "}</i> Library</li>
                <li class="list-group-item"><i class="fa fa-pencil fa-fw">{" "}</i> Applications</li>
                <li class="list-group-item"><i class="fa fa-cog fa-fw">{" "}</i> Settings</li>
            </ul>
        </div>

        <ul class="fa-ul">
            <li><i class="fa-li fa fa-check-square">{" "}</i>List icons</li>
            <li><i class="fa-li fa fa-check-square">{" "}</i>can be used</li>
            <li><i class="fa-li fa fa-spinner fa-spin">{" "}</i>as bullets</li>
            <li><i class="fa-li fa fa-square">{" "}</i>in lists</li>
        </ul>

        <div class="card" style="width: 20rem;">
            <img class="card-img-top" src="http://placehold.it/318x180" alt="Card image cap"/>
            <div class="card-block">
                <h4 class="card-title">Card title</h4>
                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card content.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
            </div>
        </div>

        <div class="card">
  <h3 class="card-header">Featured</h3>
  <div class="card-block">
    <h4 class="card-title">Special title treatment</h4>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
<hr/>

    <div class="btn-group">
        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-user fa-fw">{" "}</i> User
        </button>
        <div class="dropdown-menu">
            <a class="dropdown-item" href="#"><i class="fa fa-pencil fa-fw">{" "}</i> Edit</a>
            <a class="dropdown-item" href="#"><i class="fa fa-trash-o fa-fw">{" "}</i> Delete</a>
            <a class="dropdown-item" href="#"><i class="fa fa-ban fa-fw">{" "}</i> Ban</a>
            <div class="dropdown-divider">{" "}</div>
            <a class="dropdown-item" href="#"><i class="fa fa-unlock">{" "}</i> Make admin</a>
        </div>
    </div>

    <hr/>


        <div class="input-group margin-bottom-sm">
        <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw">{" "}</i></span>
        <input class="form-control" type="text" placeholder="Email address"/>
        </div>

        <div class="input-group">
        <span class="input-group-addon"><i class="fa fa-key fa-fw">{" "}</i></span>
        <input class="form-control" type="password" placeholder="Password"/>
        </div>







        <div class="row">
            <i class="fa fa-quote-left fa-3x fa-pull-left fa-border" aria-hidden="true">{" "}</i>
            <p>Pullquote</p>
        </div>
        <i class="fa fa-refresh fa-spin fa-3x fa-fw">{" "}</i>
        <span class="sr-only">Loading...</span>

    </div>)