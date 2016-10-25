function gameRow() {
  $("div[data-link]").click(function() {
    window.location = $(this).attr('data-link');
  })
}
