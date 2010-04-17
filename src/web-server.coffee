sys: require "sys"
http: require "http"
fs: require "fs"

# The static file server
require("http").createServer((req, res) ->

  sys.puts req.url

  switch req.url
    when "/"
      fs.readFile "index.html", (err, data) ->
        res.writeHead 200, {"Content-Type": "text/html", "Content-Length": data.length}
        res.write data
        res.end()
    when "/client.js"
      fs.readFile "lib/client.js", (err, data) ->
        res.writeHead 200, {"Content-Type": "application/javascript", "Content-Length": data.length}
        res.write data
        res.end()
    else
      res.writeHead 404, {"Content-Type": "text/plain"}
      res.write "Not found"
      res.end()

).listen(4000, "localhost")
