class Number_game
  #random a number as correct
  def initialize
    puts "数字を入力してください"
    @num = rand(0..100)
    #count the times you tried
    @cnt = 0
  end
  #the main of this game
  def number_game
    #when the number inputted doesn't equal the correct
    while @num_input != @num
      #input a number
      @num_input = gets.chomp.to_i
      @cnt +=1
      #judge if correct
      puts "#{@num_input}は正解より大きいです" if @num_input > @num
      puts "#{@num_input}は正解より小さいです" if @num_input < @num
      puts "正解です。正解まで#{@cnt}回答えました" if @num_input == @num
    end
  end
end

game = Number_game.new
game.number_game
