(function(){
  window.socket = new WebSocket("ws://localhost:8080/");
  socket.onopen = function onopen() {
    return console.log("Opened!");
  };
  socket.onclose = function onclose() {
    return console.log("Closed!");
  };
  socket.onmessage = function onmessage(message) {
    return console.log(("onmessage: " + (message)));
  };
})();
