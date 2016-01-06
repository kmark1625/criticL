// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap.min

$(document).ready(function() {
  var image_show;
  image_show = function() {
    var images = ['brunner.jpg', 'casablanca.jpg', 'shawshank.jpg'];
  console.log(images);
   $("body").css('background-image', "url(/images/" + images[Math.floor(Math.random() * images.length)] + ")");
  }

  $(document).on('page:load', image_show);
  image_show();

  $("#new-review").on("submit", function(event) {
    event.preventDefault();
    var $that = $(this)
    var url = $(this).attr("action")

    $.ajax({
      url: url,
      method: "GET"
      }).done(function(responseData){
        $that.append(responseData);
      });
  });
})
