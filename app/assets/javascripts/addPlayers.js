$(document).ready(function() {
  var playerArray = []
  playerArray = $.getJSON('/api/v1/participants', function (participants) {
		for (var i = 0; i < participants.length; i++) {
			participants[i].name = participants[i].first_name +" " + participants[i].last_name
		}
		var $input = $('.typeahead')
		$input.typeahead({ source:participants })
		$input.change(function() {
			  var current = $input.typeahead("getActive");
		    if (current) {
		        // Some item from your model is active!
		        if (current.name == $input.val()) {
								console.log(current)
								$input.val("")
								addPlayer(current, "#playersOnly")
									//
		            // This means the exact match is found. Use toLowerCase() if you want case insensitive match.
		        } else {
		            // This means it is only a partial match, you can either add a new item
		            // or take the active if you don't want new items
		        }
		    } else {
		        // Nothing is active so it is a new value (or maybe empty value)
		    }
		});
  })

	$("#eliminatedPlayers")


	$("#newPlayerButton").click(function(){
		var name = $('.typeahead').val()
		if(name){
			addPlayer({name: name , id: 0}, "#playersOnly");
			$('.typeahead').val("");
		}
	})

})

function addPlayer(player, location) {
	var options = ""

	if(location === "#playersOnly"){
		options = '<input type="button" name="name" value="eliminated" class="elim" data-name="' + player.name +'">';
	}else if(location === "#eliminatedPlayers"){
		$('input[data-name="'+ player.name +'"]').parent().remove()
		options= ""
	}

  $(location).prepend('<div class="player" data-id="'+ player.id + '" data-name="' + player.name +'">' + player.name + options +'</div>')

	if(location === "#playersOnly"){
		$(".player").on('click','input[data-name="'+ player.name +'"]', function(){
			addPlayer(player,"#eliminatedPlayers")
		});
	}
}

var getFinishers = function(){
	var finishers = []
	

	return finishers;
}

$("#submit").click(function(){
	var data = getFinishers()
	$.ajax({
	    url: '/api/v1/participants',
	    type: 'POST',
	    data: JSON.stringify(data),
	    contentType: 'application/json; charset=utf-8',
	    dataType: 'json',
	    async: false,
	    success: function(msg) {
	        alert(msg);
	    }
	});
})
