$(function() {
	$("#add").submit(function() {
		var name = $("input#name").val();
		var price = $("input#price").val();
		var dataString = "item[name]="+name+"&item[price]="+price;
		$.ajax( {
			type: "POST", 
			    url: "/users/1/lists/1/items",
			    data: dataString,
			    success: function(a) {
			    //  $('#theList tr:last').before("<tr><td>"+a+"</td><td>"+price+" €</td><td></td></tr>");
			}
		    } );
		return false;
	    });
    });
