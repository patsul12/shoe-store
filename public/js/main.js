$(function() {
  $(".brand").on("click", function() {
    var text = $(this).text();
    $(".brand_name").val(text);
    counter++;
  });

  $(".store").on("click", function() {
    var text = $(this).text();
    $(".store_name").val(text);
    counter++;
  });
});
