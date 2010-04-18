(function(){
  window.socket = new WebSocket("ws://10.0.1.55:8080/");
  socket.onopen = function onopen() {
    console.log("Opened!");
    return socket.send("I just heard we connected");
  };
  socket.onclose = function onclose() {
    return console.log("Closed!");
  };
  socket.onmessage = function onmessage(message) {
    return console.log(("Message recieved: " + (message)));
  };
})();
