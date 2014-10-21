// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui.js
//= require_tree .

$(document).ready(function() {

  function dates(e){
    e.preventDefault();
    $("#datepicker").datepicker({ dateFormat: "dd/mm/yy" });

    var dataString = { q: $("#datepicker").val() };

    $.ajax({
        type: "GET",
        url: "/matches",
        data: dataString,
        dataType: "JSON",
          success: function(data){
          console.log(data);
          data.forEach(displayGames)
        }
    }); 
 
  }

  $("#target").on("submit", dates);
});

function displayGames(object) {
  $("#results").append("<p>"+ object.hometeam_id +"</p>");

}



 