function participantRow() {
  $("tr[data-link]").on('click', function() {
    window.location = $(this).attr('data-link');
  });
};
