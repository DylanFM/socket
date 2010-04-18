(function(){
  var server, sockets, sys, wss;
  sys = require("sys");
  wss = require("../vendor/web-socket-server");
  sockets = [];
  server = wss.createServer("10.0.1.55", 8080, function(socket) {
    sys.puts("Client connected");
    sockets.push(socket);
    socket.addListener('connect', function() {
      return sys.puts("Client connected");
    });
    socket.addListener("close", function() {
      return sys.puts("Connection closed");
    });
    return socket.addListener("message", function(data) {
      var _a, _b, _c, _d, sock;
      sys.puts(("Received: " + (data)));
      _a = []; _c = sockets;
      for (_b = 0, _d = _c.length; _b < _d; _b++) {
        sock = _c[_b];
        _a.push(sock.send(data));
      }
      return _a;
    });
  });
  server.listen();
})();
