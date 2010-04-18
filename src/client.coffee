window.socket: new WebSocket("ws://10.0.1.55:8080/")

socket.onopen: ->
  console.log "Opened!"
  socket.send("I just heard we connected")

socket.onclose: ->
  console.log "Closed!"

socket.onmessage: (message) ->
  console.log "Message recieved: ${message}"
