sys: require("sys")
wss: require("../vendor/web-socket-server")

sockets: []

server: wss.createServer "10.0.1.55", 8080, (socket) ->

  sys.puts "Client connected"
  sockets.push socket

  socket.addListener 'connect', ->
    sys.puts "Client connected"

  socket.addListener "close", ->
    sys.puts "Connection closed"

  socket.addListener "message", (data) ->
    sys.puts "Received: ${data}"
    for sock in sockets
      sock.send data

server.listen()
