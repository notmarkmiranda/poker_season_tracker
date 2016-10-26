function participantRow() {
  $("tr[data-link]").on('click', function() {
    console.log("participant row")
    window.location = $(this).attr('data-link');
  });
};
