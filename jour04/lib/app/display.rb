class Play
    attr_accessor :players, :game_number, :attack_array
    attr_reader   :position_list

  def initialize(players)
    @players = players
    @attack_array = [" ",  " ",  " ",  " ",  " ",  " ",  " ",  " ",  " "]
    @position_list = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
  end


#### CETTE PARTIE COMPARE LA STRING AVEC LES CASES 'a1, b1 etc...'
  def compare(str)
    @position_list.each do |position|
      if position == str
        return @position_list.index(position)
      end
    end
    puts "Wrong Value: Start again"
    print ">"
    self.compare(gets.chomp)
  end

#### CETTE PARTIE AFFICHE LES CROIX
  def play_x(joueur)
    self.display_match
    print "c'est le tour de #{joueur.name}\n>"
    @attack_array[self.is_empty(self.compare(gets.chomp))] = "x".yellow
  end


#### CETTE PARTIE AFFICHE LES RONDS  
  def play_o(joueur)
    self.display_match
    print "c'est le tour de #{joueur.name}\n>"
    @attack_array[self.is_empty(self.compare(gets.chomp))] = "o".green
  end


#### CETTE PARTIE VÉRIFIE SI LA PLACE JOISIE EST DISPONIBLE  
  def is_empty(index)
    if @attack_array[index] != " "
      puts "Case déja remplis. Choose an other"
      print ">"
      return self.is_empty(self.compare(gets.chomp))
    end
    return index
  end

  def display_match
puts       "===============   TIC TAC TOE   ===============".blue
puts       ""
puts       ""             
puts       "pour jouer :     -------------   | #{@players[0].name}"
puts       "                 | #{@attack_array[0]} | #{@attack_array[1]} | #{@attack_array[2]} |   | #{@players[0].games_won} games won"
puts       "choisir entre    -------------   |"
puts       "A1, A2, A3       | #{@attack_array[3]} | #{@attack_array[4]} | #{@attack_array[5]} |   |-------------"
puts       "B1, B2, B3       -------------   | #{@players[1].name}"
puts       "C1, C2, C3       | #{@attack_array[6]} | #{@attack_array[7]} | #{@attack_array[8]} |   | #{@players[1].games_won} games won"
puts       "                 -------------   |" 
  end

  def continue
    if ((@attack_array[0] == @attack_array[1] && @attack_array[1] == @attack_array[2] && @attack_array[0] != " ") ||
        (@attack_array[3] == @attack_array[4] && @attack_array[4] == @attack_array[5] && @attack_array[3] != " ") ||
        (@attack_array[6] == @attack_array[7] && @attack_array[7] == @attack_array[8] && @attack_array[6] != " ") ||
        (@attack_array[0] == @attack_array[3] && @attack_array[3] == @attack_array[6] && @attack_array[0] != " ") ||
        (@attack_array[1] == @attack_array[4] && @attack_array[4] == @attack_array[7] && @attack_array[1] != " ") ||
        (@attack_array[2] == @attack_array[5] && @attack_array[5] == @attack_array[8] && @attack_array[2] != " ") ||
        (@attack_array[0] == @attack_array[4] && @attack_array[4] == @attack_array[8] && @attack_array[0] != " ") ||
        (@attack_array[2] == @attack_array[4] && @attack_array[4] == @attack_array[6] && @attack_array[2] != " "))
          return false
    end
    return true
  end
end
