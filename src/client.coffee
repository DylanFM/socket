window.socket: new WebSocket("ws://localhost:8080/")

socket.onopen: ->
  console.log "Opened!"

socket.onclose: ->
  console.log "Closed!"

socket.onmessage: (message) ->
  console.log "onmessage: ${message}"
