class Players
  class Computer < Player
    attr_accessor :board, :opponent_token, :valid_moves

    def initialize(token)
      super
      if @token == "X"
        @opponent_token = "O"
      else
        @opponent_token = "X"
      end
    end

    def move(board)
      player_move = nil

      Game::WIN_COMBINATIONS.detect do |combo|
        # checks first for possible wins, then possible blocks of the opponent
        if combo.select{|i| board.cells[i] == @token}.size == 2 && combo.any?{|i| !board.taken?(i + 1)}
          player_move = combo.detect{|i| !board.taken?(i + 1)}.to_i.+(1).to_s

        elsif combo.select{|i| board.cells[i] == @opponent_token}.size == 2 && combo.any?{|i| !board.taken?(i + 1)}
          player_move = combo.detect{|i| !board.taken?(i + 1)}.to_i.+(1).to_s
        elsif player_move.nil?
          player_move = [5, 1, 3, 7, 9, 2, 4, 6, 8].detect{|i| !board.taken?(i + 1)}.to_s
        end
      end
      player_move
    end
  end
end
