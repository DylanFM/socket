fs: require("fs")
http: require("http")
sys: require("sys")
url: require("url")

exports.routes: {}

exports.get: ->

  path: arguments[0]
  file: arguments[1]()

  exports.routes[path] ||= {}
  exports.routes[path].GET: ->
    fs.readFileSync file

exports.error: (res) ->
  res.writeHead 404, {'Content-Type': 'text/html'}
  res.write "No route matched."

http.createServer((req, res) ->
  path: url.parse(req.url).pathname
  if path in exports.routes

    types: {
      css : "text/css"
      html: "text/html"
      js  : "text/javascript" }

    extension: path.match(/(.*)\.(.+)/)
    contentType: if extension? then types[extension[2]] else types.html

    file: exports.routes[path].GET
    if file?
      res.writeHead 200, {'Content-Type': contentType}
      res.write file()
    else
      exports.error(res)
    sys.puts path
    res.end()
  else
    exports.error(res)
    res.end()
).listen 5678, 'localhost'

sys.puts "Listening on port 5678"
