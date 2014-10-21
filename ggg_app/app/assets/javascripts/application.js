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
//= require searches.js
//= require_tree .

$(function() {

  $("#results").hide();
  $(".right-column").hide();
  $("#datepicker").datepicker({ dateFormat: "dd/mm/yy" });


  function dates(e){
    e.preventDefault();
    var dataString = { q: $("#datepicker").val() };

    $.ajax({
        type: "GET",
        url: "/matches",
        data: dataString,
        dataType: "JSON",
        success: function(data){
          var tmp= $('<div></div>');
          $.each(data, function(k, v){
            $(tmp).append(displayGames(v));
          });
          $('.joined tbody').html(tmp.html());
          $("#results").slideToggle()
        }
    }); 
  }

  $("#submit").click("submit", dates);

  $("#match_details").on("click", function(){
    alert( "Handler for .click() called." );
  })



});

function displayGames(object) {
  return '<tr><td>'+object.div+ '</td><td>'+object.season+'</td><td>'+object.date+'</td><td>'+object.hometeam_id+'</td><td><button id="match_details">'+object.id+ '</button></td><td>'+object.awayteam_id+ '</td></tr>';

}

 









 