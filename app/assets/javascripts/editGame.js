$(document).ready(function() {
  $('#eliminate-player').on('click', function(e) {
    e.preventDefault
    var finishing_place = $('#finishing_place :selected').val();
    var participant_id = $('#participant_id :selected').val();
    var gameId = $('#game-container').data().gameId
    var playerData = { player: { finishing_place: finishing_place, participant_id: participant_id, game_id: gameId } }
    createPlayer(playerData)
    resetForm()
  });

  $('#participant_id').on('change', function() {
    var that = $(this)
    if (that.val() == "Create New Player") {
      appendPlayerCreation()
    }
    // }
  })

  $('#create-player').on('click', function(e) {
    e.preventDefault
    var first_name = $('#first_name').val();
    var last_name = $('#last_name').val();
    var finishing = $('#nfp').val();
    var gameId = $('#game-container').data().gameId
    var participant_data = { participant: { first_name: first_name, last_name: last_name } }
    $.ajax({
      url: '/api/v1/participants',
      type: 'post',
      dataType: 'json',
      data: participant_data,
      success: function(data) {
        var playerData = { player: { finishing_place: finishing, participant_id: data.id, game_id: gameId } }
        createPlayer(playerData)
      }
    })
  })

})

function resetForm() {
  $('#participant_id').val('person')
  $('#finishing_place').val('place')
}

function hideForm() {
  $('#new-player').addClass('hidden')
}

function createPlayer(playerData) {
  $.ajax({
    url: '/api/v1/players',
    type: 'post',
    dataType: 'json',
    data: playerData,
    success: function(data) {
      [sort_response({game_id: data.game_id}), hideForm()]
    }
  });
}

function appendPlayerCreation() {

  $('#new-player').removeClass('hidden')
  // resetForm()
}

function sort_response(data) {
  if (data.game_id) {
    var players = getGamePlayers(data.game_id)
  }
}

function getGamePlayers(id) {
  $.ajax({
    url: '/api/v1/games/' + id,
    type: 'get',
    dataType: 'json',
    success: function(data) {
      $('#eliminatedPlayers').replaceWith(formatPlayers(data.players))
    }
  })
}

function formatPlayers(players) {
  var formatted = "<div id='eliminatedPlayers'><ul class='list-group'>"
  for (var i = 0; i < players.length; i ++) {
    formatted += '<li class="list-group-item justify-content-between"><span class="badge">' + players[i].finishing_place + '</span>' +
    players[i].name + '</li>'
  }
  formatted += "</ul></div>"
  return formatted
}
