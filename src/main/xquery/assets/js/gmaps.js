/* 
  var myLatlng = new google.maps.LatLng(-34.397, 150.644);
var mapOptions = {
  zoom: 8,
  center: myLatlng,
  mapTypeId: 'satellite'
};
var map = new google.maps.Map(document.getElementById('map'), mapOptions);
; 



function initMap() {
    var map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 40.834431, lng: 17.358400},
        zoom: 8
    });
    
    var marker = new google.maps.Marker({
    position: myLatLng,
    map: map,
    title: 'Hello World!'
  });
}
*/
var marker;

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 13,
    center: {lat: 59.325, lng: 18.070}
  });

  marker = new google.maps.Marker({
    map: map,
    draggable: true,
    animation: google.maps.Animation.DROP,
    position: {lat: 59.327, lng: 18.067}
  });
  marker.addListener('click', toggleBounce);
}

function toggleBounce() {
  if (marker.getAnimation() !== null) {
    marker.setAnimation(null);
  } else {
    marker.setAnimation(google.maps.Animation.BOUNCE);
  }
}