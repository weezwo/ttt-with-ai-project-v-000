class Players
  class Human < Player
    def move(board)
      puts "Please enter 1-9:"
       move = gets.strip
       move
    end
  end
end
