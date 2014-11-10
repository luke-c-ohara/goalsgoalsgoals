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
          $(".joined").slideToggle()
        }
    }); 
  }

  if ($('#search-fixtures').length) {
    $("#target").on("submit", dates);
  }
  
  $("body").on("click", ".last_five",function(){
    $("#last_five").slideToggle()
  });

  $("body").on("click", ".home_form",function(){
    $("#home_form").slideToggle()
    
  });

  $("body").on("click", ".away_form",function(){
    $("#away_form").slideToggle()
    
  });

  $("body").on("click", ".all_form",function(){
    $("#all_form").slideToggle()
    
  });

  $("body").on("click", ".fixtures",function(){
    $("#fixtures").slideToggle()
    
  });

  $("body").on("click", ".seven_days",function(){
    $("#seven_days").slideToggle()
      $(this).siblings('#home_last_five').toggle('slow')

  });


  $("body").on("click", ".all_fixtures",function(){
    $("#all_fixtures").slideToggle()
    
  });


});

function displayGames(object) {
  return '<tr><td>'+object.div+ '</td><td>'+object.season+'</td><td>'+object.date+'</td><td>'+object.hometeam_name+'</td><td>v</td><td>'+object.awayteam_name+ '</td></tr>';

}


 









 