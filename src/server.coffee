sys: require("sys")
wss: require("../vendor/web-socket-server")

server: wss.createServer "localhost", "8080", (socket) ->

  sys.puts "Connection open"

  socket.addListener "close", ->
    sys.puts "Connection closed"

  socket.addListener "message", (data) ->
    sys.puts "Received: ${data}"

  socket.send "Hello there client!"

server.listen()
