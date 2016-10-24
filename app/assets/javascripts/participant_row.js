$(document).ready(function() {
  $("tr[data-link]").click(function() {
    window.location = $(this).attr('data-link');
  })
})
