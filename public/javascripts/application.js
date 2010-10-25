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
	    $.get(this.href, { '_method': 'edit' } , null, "script");
	    return false;
	})
    return this;
};

$(document).ready(function() {
	$("a.item_edit_btn").submitEditLinkWithAjax();
    });

jQuery.fn.submitSaveBtnWithAjax = function() {
    this.submit('click', function(){
	    $.put(this.action, $(this).serialize() , null, "script");
	    return false;
	})
    return this;
};

function notify(type, message) {
    $("<div id='notice' />")
	.stop()
	.addClass(type)
	.html(message)
	.appendTo('body')
	.show()
	.fadeOut(2000);
}

function setupListButtons() {
    $("td.buttons").find('img').hide();
    $(".list_item").mouseover(function() {
	    $(this).find("td.buttons").find('img').show();
	}).mouseout(function(){
		$(this).find("td.buttons").find('img').hide();
	    });
    $("a.item_delete_btn").submitDeleteLinkWithAjax();
}

function setupPriceField() {
    $("#item_price").bind('keydown keyup', function() {
	    var val = parseFloat($(this).val());
	    if (isNaN(val)){
		$(this).attr("value","");
	    }
	});
}
	
function setupLoginField() {
    var fields = $("#loginfields input");
    fields.css("color","grey");
    fields.attr("value", "login");
    fields.focus(function() {
	    if ($(this).val() == 'login'){
		$(this).attr("value", "");
		$(this).css("color","black");
	    }
	});
    fields.blur(function() {
	    if ($(this).val() == ''){
		$(this).attr("value", "login");
		$(this).css("color","grey");
	    }
	});
}

$(document).ready(function() {
	setupPriceField();
	setupLoginField();
	setupListButtons();
    });
