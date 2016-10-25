function participantRow() {
  $("tr[data-link]").click(function() {
    window.location = $(this).attr('data-link');
  })
}
