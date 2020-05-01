require 'socket'

class Client
  def initialize
    @socket = TCPSocket.new('localhost', 2345)
  end

  def execute
    loop { user_session }
  end

  def user_session
    puts @socket.gets
    puts "Wow what a rude server... I'm going to say Sarah"
    @socket.puts "Sarah"
    puts @socket.gets
  end
end

client = Client.new
client.execute
