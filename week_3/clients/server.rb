require 'socket'

class Server
  def initialize
    server = TCPServer.new(2345)
    @socket = server.accept
  end

  def execute
    loop { user_session }
  end

  private
  def user_session
    @socket.puts "HELLO CLIENT WHAT IS YOUR NAME?"
    name = @socket.gets.chomp
    @socket.puts "THAT'S A LOVELY NAME #{name}"
  end
end

server = Server.new
server.execute
