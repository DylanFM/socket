sys: require("sys")
wss: require("../vendor/web-socket-server")

server: wss.createServer "10.0.1.55", 8080, (socket) ->

  sys.puts "Connection open"

  socket.addListener 'connect', ->
    sys.puts "Client connected"

  socket.addListener "close", ->
    sys.puts "Connection closed"

  socket.addListener "message", (data) ->
    sys.puts "Received: ${data}"
    socket.send "Hey, you just sent me something!"

  setInterval (-> socket.send("Moo cows")), 10000

server.listen()
