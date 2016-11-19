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
		        if (current.name == $input.val()) {
								console.log(current)
								$input.val("")
								addPlayer(current, "#playersOnly")
		        }
		    }
		});
  })

	$("#newPlayerButton").click(function(){
		var name = $('.typeahead').val()
		if(name){
			addPlayer({name: name , id: 0}, "#playersOnly");
			$('.typeahead').val("");
		}
	})
	$("#submit").click(function(){
		var data = getFinishers()
		var chars = window.location.pathname.split('');
		var gameId= chars[7]+chars[8];
		console.log(gameId)
		$.ajax({
		    url: '/api/v1/games/'+ gameId,
		    type: 'patch',
		    data: JSON.stringify(data),
		    contentType: 'application/json; charset=utf-8',
		    dataType: 'json',
		    async: false,
		    success: function(msg) {
		        alert(msg);
		    }
		});
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
	var finishers = [
		{
			name:"Mark Harris",
			id: 1
		},
		{
			name: "Andrew Fullerton",
			id: 0
		},
		{
			name: "Mark Miranda",
			id: 3
		}
	]


	return finishers;
}
