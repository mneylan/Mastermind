=begin
#Computer randomly selects colors
#12 turns to guess
#player guesses the combination of the colors. An indicator will be given to them if they pick and right color.
#Another will be given to them if they pick the right place as well.
$possible_colors = ["red", "orange", "yellow", "green", "blue", "violet"]
$computer_colors = $possible_colors.shuffle[0..3]


#$possible_colors = ["red", "orange", "yellow", "green", "blue", "violet"]
#$computer_colors = $possible_colors.shuffle[0..3]

 #decrement by 1 each guess



def player_guess
guess =  []
i = 0

puts "Type in the colors one by one, codebreaker."
p possible_colors
puts "\n"
while i < 4
  p_guess = gets.chomp.downcase
  redo if !possible_colors.include?(p_guess)
  guess << p_guess
  
  p guess
  i += 1
end
return guess
end

#check guess, computer displays output letting player know how right they were. 
#"warm" = right color  "hot" = right color right spot

def check_guess(guess)
display_hints = []

guess.each_with_index do |color, index|
  if $computer_colors.include?(color)
    if guess[index] == $computer_colors[index]
      display_hints << "hot"
    else display_hints << "warm"
    end

  end
end
puts
p display_hints
return display_hints
end

#check if player's guess matches computers pattern
def did_you_win?(checked_guess)
if checked_guess == ["hot", "hot", "hot", "hot"]
  return true
else false
end
end

def game()
  puts "Welcome to mastermind. You will be trying to guess the order of colors that the
  computer creates. There are 6 possible colors, and the computer will make a pattern of 4 of them. The computer
  can't reuse colors. You will have 12 tries to crack the code. Type your guesses into the console. Good luck, codebreaker."
  puts "------------------------------------------------"
  p $computer_colors
  #possible_colors.shuffle[0..3]
  guess_count = 2

while guess_count > 0
  p_guess = player_guess
  checked_guess = check_guess(p_guess)
  did_you_win?(checked_guess)
  if did_you_win?(checked_guess) == true
    puts "You did it, codebreaker. You've cracked the code."
    return "You've cracked the code"
  end
  guess_count -= 1
  puts
  puts "#{guess_count} tries remaining."
  puts
  puts "----------------------------------------------------"
end
puts "Better luck next time!"
end

=end

class Mastermind
  def initialize
    @possible_colors = ["red", "orange", "yellow", "green", "blue", "violet"]
    @computer_colors = @possible_colors.shuffle[0..3]
    @guess_count = 12
    @computer_guess = []
    @correct_comp_guesses = []
  end

  
  def player_guess
    guess = []
    i = 0
    puts
    puts "Type in the colors one by one."
    p @possible_colors
    puts "\n"
    while i < 4
      p_guess = gets.chomp.downcase
      redo if !@possible_colors.include?(p_guess)
      guess << p_guess
      
      p guess
      i += 1
    end
    return guess
    end

  def check_guess(guess)
    display_hints = []
      
    guess.each_with_index do |color, index|
      if @computer_colors.include?(color)
        if guess[index] == @computer_colors[index]
            display_hints << "hot"
        else display_hints << "warm"
        end
      
      end
    end
    puts
    p display_hints
    return display_hints
  end

  def did_you_win?(checked_guess)
    if checked_guess == ["hot", "hot", "hot", "hot"]
      return true
    else false
    end
    end

  def game()
    puts "Welcome to mastermind. You will be trying to guess the order of colors that the
    computer creates. There are 6 possible colors, and you or the computer will make a pattern of 4 of them. You can't use the same
    color more than once in your code. You will have 12 tries to crack the code. Type your guesses into the console."
    puts "------------------------------------------------"
    puts "to begin, do you want to be the code maker or breaker? Type 'maker' or 'breaker"
    player_choice = gets.chomp.downcase
    
    if player_choice == "maker"
      @computer_colors = player_guess
    end
    p @computer_colors
    #possible_colors.shuffle[0..3]
    
    
    while @guess_count > 0
      if player_choice == "maker"
        p_guess = computer_guess
      else p_guess = player_guess
      end
      
      if @correct_comp_guesses == @computer_colors
        puts "Nice job computer. You cracked the code."
        p @correct_comp_guesses
        return 
      end
      checked_guess = check_guess(p_guess)
      did_you_win?(checked_guess)
      if did_you_win?(checked_guess) == true
         puts "You did it, codebreaker. You've cracked the code."
        return 
      
      end
      @guess_count -= 1
      puts
      puts "#{@guess_count} tries remaining."
      p @correct_comp_guesses
      puts
      puts "----------------------------------------------------"
    end
    puts "Better luck next time!"
    end
end



def computer_guess
  
shuffled_possible_colors = @possible_colors.shuffle

shuffled_possible_colors.each_with_index do |color, index|
#["orange", "blue", "yellow", "violet" ]
if color == @computer_colors[index]
  @correct_comp_guesses[index] = color
  @possible_colors.delete(color)
else @computer_guess << color
end
end

end

games = Mastermind.new
games.game