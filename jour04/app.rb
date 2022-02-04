require 'bundler'
Bundler.require

require_relative 'lib/app/players.rb'
require_relative 'lib/app/display.rb'

class Game
    def initialize
        puts "GAME INIT..."
        puts "name players"
        print "Player_1 >"
        @player1 = Player.new(gets.chomp)
        print "Player_2 >"
        @player2 = Player.new(gets.chomp)
    end

    def colorize
        @player1.name = @player1.name.yellow
        @player2.name = @player2.name.green
    end

    def start
        start = Play.new([@player1, @player2])
        @player1.turns = 0
        @player2.turns = 0
        while(true)
            start.play_x(@player1)
            @player1.turns += 1
            unless start.continue
                start.display_match
                puts "#{@player1.name} à Gagné !"
                @player1.games_won += 1
                @player2.games_lost += 1
                self.again
                break
            end
            if @player1.turns == 5
                puts "Egalité"
                self.again
                break
            end
            start.play_o(@player2)
            unless start.continue
                start.display_match
                puts "#{@player2.name} à Gagné !"
                @player2.games_won += 1
                @player1.games_lost += 1
                self.again
                break
            end
        end
    end

    def again
        puts "\n\nPartie Terminée voulez vous recommencer ? (Y/n)"
        print ">"
        value = gets.chomp

        if value == "y" || value == "Y"
            self.start
        elsif value == "n" || value == "N"
            exit
        else
            self.again
        end
    end
end

partie = Game.new

partie.colorize
partie.start
