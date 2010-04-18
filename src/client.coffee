window.socket: new WebSocket("ws://10.0.1.55:8080/")

socket.onopen: ->
  console.log "Opened!"
  $("fieldset").fadeIn()
  $("#send").click (event) ->
    socket.send $("#name").val() + ": " + $("#word").val()

socket.onclose: ->
  console.log "Closed!"

socket.onmessage: (message) ->
  $("ul").append "<li>" + message.data + "</li>"

# DOM ready
$ ->
  $("fieldset").hide()