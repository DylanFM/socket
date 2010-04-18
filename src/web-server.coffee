sys: require("sys")
app: require("../vendor/sydjs")

app.get '/', -> 'index.html'

app.get '/stylesheet.css', -> 'stylesheet.css'
app.get '/client.js', -> 'lib/client.js'
app.get '/jquery-1.4.2.js', -> 'vendor/jquery-1.4.2.js'

app.error: (res) ->
  res.writeHead 404, {'Content-Type': 'text/html'}
  res.write "Custom error: no route matched."
