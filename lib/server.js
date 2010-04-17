(function(){
  var server, sys, wss;
  sys = require("sys");
  wss = require("../vendor/web-socket-server");
  server = wss.createServer("localhost", "8080", function(socket) {
    sys.puts("Connection open");
    socket.addListener("close", function() {
      return sys.puts("Connection closed");
    });
    socket.addListener("message", function(data) {
      return sys.puts(("Received: " + (data)));
    });
    return socket.send("Hello there client!");
  });
  server.listen();
})();
