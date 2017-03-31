// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//  require turbolinks
//= require jquery-ui
//= require bootstrap-sprockets
//= require_tree .


// autocomplete
var search=(function(){
  $('#category-input').autocomplete({
    source: '/categories/autocomplete.json'
  })

  $('#skill-input').autocomplete({
    source: '/skills/autocomplete.json'
  })
})
$(document).ready(search);
$(document).on('page:load', search);

// subscriptions - submit form
$(document).on('submit','#new_subscription',function(event){
  event.preventDefault();
  let $muh_form = $(this).serialize();
  var id = $(this).data("id");
  var catchthepromise = $.post('/accounts/' + id + '/subscriptions', $muh_form);
  catchthepromise.done(function(sub){
      console.log(sub)
      $("#subpanel").append("<div class='muh-tags' id='tagger-" + sub["category"]["id"]+ "'><span class='muh-tags-inner'><a class='tag-btn-inner' href='#'>"+sub["category"]["name"]+"</a><a data-id='"+sub["category"]["id"]+"' data-account='" + sub["account"]["id"] + "' class='kill-cat' href='#'><span class='tag-x'>X</span></a></span></div>");
      $("#category-input").val("")
      $("#js-tag").prop('disabled', false)
      $(".nextButton").css("display", "block");
  })
  return false
});

// subscriptions - delete
$(document).on("click", ".kill-cat", function(event){
  var xid = $(this).data("id");
  var acct = $(this).data("account")
  var url="/accounts/" + acct + "/subscriptions/" + xid
  var req = $.ajax({
    type: "DELETE",
    url: url
  });

  req.done(function(data){
     if( data["subscription_count"] <= 0 ){
       $(".nextButton").hide();
     }
     $("#tagger-"+xid).hide();
  });
  return false;
})
