document.addEventListener("turbolinks:load", function(){
  var form = document.getElementById("save_views");
  if(form !== null) form.submit();
})
