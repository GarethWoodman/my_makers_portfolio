require 'socket'
require './note_list'

# 1. In current directory - ruby simple_server.rb
# 2. In a seperate terminal window - telnet localhost 2345

# Exercises :2:
# 1. Keep the server running so that user can reconnect ('loop block')
# 2. Keep the user connected, typing stuff until they type 'quit'
# 3. Connect to pair's laptop
# 4. Create a seperate NoteList class to make a notes app

class Session
  def initialize(server = TCPServer.new(2345))
    @socket     = server.accept
    @note_list  = NoteList.new
  end

  def execute
    loop { break if user_session == "quit" }
    @socket.close
  end

  private
  def user_session
    @socket.puts "What do you say?"
    they_said = @socket.gets.chomp
    print_response(they_said)
  end

  def print_response(they_said)
    if they_said == "show"
      @socket.puts @note_list.print
    elsif they_said == "quit"
      @socket.puts "Goodbye!"
    else
      @socket.puts "You said: #{they_said}"
      @note_list.add(they_said)
    end
    they_said
  end
end



session = Session.new
session.execute
