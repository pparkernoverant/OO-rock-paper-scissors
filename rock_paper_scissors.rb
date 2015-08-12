
module RockPaperScissors

  CHOICES = { 'R' => ['Rock', 'S', 'smashes'],
              'P' => ['Paper', 'R', 'covers'], 
              'S' => ['Scissors', 'P', 'cuts'] }

  class Game
    def initialize
      @completed = false
      @player = Human.new("You")
      @computer = Computer.new("Computer")
      @results = "Results:\n"
    end

    def play
      if @completed
        puts @results
      else
        player_choice = @player.getChoice
        computer_choice = @computer.getChoice

        # display choices
        @results << "#{@player.name} picked #{CHOICES[player_choice][0]} and #{@computer.name} picked #{CHOICES[computer_choice][0]}.\n"

        # declare winner
        if CHOICES[player_choice][1] == computer_choice
          @results << "#{CHOICES[player_choice][0]} #{CHOICES[player_choice][2]} #{CHOICES[computer_choice][0]}!\n"
          @results << "#{@player.name} won!"
        elsif CHOICES[computer_choice][1] == player_choice
          @results << "#{CHOICES[computer_choice][0]} #{CHOICES[computer_choice][2]} #{CHOICES[player_choice][0]}!\n"
          @results << "#{@computer.name} won!"
        else
          @results << "It's a tie."
        end

        puts @results
        @completed = true
      end
    end
  end

  class Player
    attr_reader :name

    def initialize(name)
      @name = name
    end  
  end

  class Human < Player
    def getChoice
      puts "Choose one (P/R/S):"
      player_choice = gets.chomp.upcase
      until CHOICES.has_key? player_choice
        puts "Invalid input."
        puts "Choose one (R/P/S):"
        player_choice = gets.chomp.upcase
      end

      return player_choice
    end 
  end

  class Computer < Player
    def getChoice
      return CHOICES.keys.sample
    end
  end

end

include RockPaperScissors

puts "Play Rock Paper Scissors!\n"
continue = true

while continue
  rpsGame = Game.new
  rpsGame.play

  # prompt for replay
  puts "Play again? (Y/N)"
  play_again = gets.chomp.upcase
  continue = false unless ['Y', 'YES'].include? play_again
end

