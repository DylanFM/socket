(function(){
  window.socket = new WebSocket("ws://10.0.1.55:8080/");
  socket.onopen = function onopen() {
    console.log("Opened!");
    $("fieldset").fadeIn();
    return $("#send").click(function(event) {
      return socket.send($("#name").val() + ": " + $("#word").val());
    });
  };
  socket.onclose = function onclose() {
    return console.log("Closed!");
  };
  socket.onmessage = function onmessage(message) {
    return $("ul").append("<li>" + message.data + "</li>");
  };
  // DOM ready
  $(function() {
    return $("fieldset").hide();
  });
})();
