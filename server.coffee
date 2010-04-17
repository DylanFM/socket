http: require("http")
sys: require("sys")
fs: require("fs")

http.createServer((req, res) ->

  sys.puts req.url

  switch req.url
    when "/"
      fs.readFile "index.html", (err, data) ->
        res.writeHead 200, {"Content-Type":"text/html", "Content-Length":data.length}
        res.write data
        res.close()
    else
      res.writeHead 404, {"Content-Type":"text/plain", "Content-Length":9}
      res.write "Not found"
      res.close()

).listen(5678, "localhost")

sys.puts "Listening on port 5678"
