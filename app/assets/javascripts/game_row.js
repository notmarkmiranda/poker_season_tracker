function gameRow() {
  $("div[data-link]").on('click', function() {
    window.location = $(this).attr('data-link');
  })
}
