// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
    });

jQuery.fn.submitWithAjax = function() {
    this.submit(function() {
 	    $.post(this.action, $(this).serialize(), null, "script");
 	    return false;
 	})
    return this;
};

$(document).ready(function() {
 	$("#new_item").submitWithAjax();
    }) ;

$(document).ready(function() {
 	$(".button_to").submitWithAjax();
    }) ;

jQuery.fn.submitDeleteLinkWithAjax = function() {
    this.live('click', function(event){
	    //if (confirm ("Are you sure?"))
	    $.post(this.href, { '_method': 'delete' } , null, "script");
	    return false;
	})
    return this;
};

$(document).ready(function() {
	$("a.item_delete_btn").submitDeleteLinkWithAjax();
    });


jQuery.fn.submitEditLinkWithAjax = function() {
    this.live('click', function(event){
	    //if (confirm ("Are you sure?"))
	    $.post(this.href, { '_method': 'edit' } , null, "script");
	    return false;
	})
    return this;
};

//$(document).ready(function() {
//	$("a.item_edit_btn").submitEditLinkWithAjax();
//    });

$(document).ready(function() {
	$("td.buttons").find('img').hide();
	$("tr.list_item").mouseover(function() {
		$(this).find("td.buttons").find('img').show();
	    }).mouseout(function(){
		    $(this).find("td.buttons").find('img').hide();
		});
    });

function notify(type, message) {
    $("<div id='notice' />")
	.stop()
	.addClass(type)
	.html(message)
	.appendTo('body')
	.show()
	.fadeOut(2000);
}