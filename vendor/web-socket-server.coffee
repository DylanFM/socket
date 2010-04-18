sys: require 'sys'
net: require 'net'

class Server
  constructor: (hostname, port, callback) ->
    @hostname: hostname
    @port: port
    @net: net.createServer (socket) =>

      socket.setTimeout 0
      socket.setNoDelay true
      socket.setEncoding 'utf8'

      socket.upgraded: false
      socket.messageData: ''

      socket.send: (payload) ->

        sys.puts "Sending ${payload}"

        socket.write "\u0000${payload}\uffff"

      socket.handleMessageData: (data) ->
        socket.messageData += data

        chunks: socket.messageData.split('\ufffd')
        for chunk in chunks.slice(0, -1)
          if chunk[0] is '\u0000'
            socket.emit 'message', chunk.slice(1)
          else
            socket.close()
            return

        socket.messageData: chunks.pop()

      socket.handleHandshake: (request) =>

        origin: request.match(/\sOrigin: (.*)\s/)[1]

        sys.puts "Handshaking with ${origin}"

        socket.write [
          'HTTP/1.1 101 Web Socket Protocol Handshake',
          'Upgrade: WebSocket',
          'Connection: Upgrade',
          "WebSocket-Origin: ${origin}",
          "WebSocket-Location: ws://${@hostname}:${@port}/",
          '',
          ''].join("\r\n")

        socket.upgraded: true

        callback(socket)

      socket.addListener 'data', (data) ->
        if socket.upgraded
          socket.handleMessageData(data)
        else
          socket.handleHandshake(data)

  listen: ->
    @net.listen @port, @hostname

exports.Server: Server

exports.createServer: (hostname, port, readyFn) ->
  server: new Server hostname, port, readyFn