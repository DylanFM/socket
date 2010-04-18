(function(){
  var app, sys;
  sys = require("sys");
  app = require("../vendor/sydjs");
  app.get('/', function() {
    return 'index.html';
  });
  app.get('/stylesheet.css', function() {
    return 'stylesheet.css';
  });
  app.get('/client.js', function() {
    return 'lib/client.js';
  });
  app.get('/jquery-1.4.2.js', function() {
    return 'vendor/jquery-1.4.2.js';
  });
  app.error = function error(res) {
    res.writeHead(404, {
      'Content-Type': 'text/html'
    });
    return res.write("Custom error: no route matched.");
  };
})();
