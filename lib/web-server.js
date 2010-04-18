(function(){
  var fs, http, sys;
  sys = require("sys");
  http = require("http");
  fs = require("fs");
  // The static file server
  require("http").createServer(function(req, res) {
    var _a;
    sys.puts(req.url);
    if ((_a = req.url) === "/") {
      return fs.readFile("index.html", function(err, data) {
        res.writeHead(200, {
          "Content-Type": "text/html",
          "Content-Length": data.length
        });
        res.write(data);
        return res.end();
      });
    } else if (_a === "/client.js") {
      return fs.readFile("lib/client.js", function(err, data) {
        res.writeHead(200, {
          "Content-Type": "application/javascript",
          "Content-Length": data.length
        });
        res.write(data);
        return res.end();
      });
    } else {
      res.writeHead(404, {
        "Content-Type": "text/plain"
      });
      res.write("Not found");
      return res.end();
    }
  }).listen(4000, "localhost");
})();
