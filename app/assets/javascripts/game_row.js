function gameRow() {
  $("div[data-link]").on('click', function() {
    console.log("game row")
    window.location = $(this).attr('data-link');
  });
};
