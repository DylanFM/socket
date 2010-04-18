(function(){
  var server, sys, wss;
  sys = require("sys");
  wss = require("../vendor/web-socket-server");
  server = wss.createServer("10.0.1.55", 8080, function(socket) {
    sys.puts("Connection open");
    socket.addListener('connect', function() {
      return sys.puts("Client connected");
    });
    socket.addListener("close", function() {
      return sys.puts("Connection closed");
    });
    socket.addListener("message", function(data) {
      sys.puts(("Received: " + (data)));
      return socket.send("Hey, you just sent me something!");
    });
    return setInterval((function() {
      return socket.send("Moo cows");
    }), 10000);
  });
  server.listen();
})();
