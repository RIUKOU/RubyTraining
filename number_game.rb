class Number_game
  def initialize
    puts "数字を入力してください"
    @num = rand(0..100)
    @flag_small = false
    @flag_correct = false
    @cnt = 0
  end

  def number_game
    while true
      @num_input = gets.chomp.to_i
      @cnt +=1
      if @num_input == @num
       @flag_correct = true
       output
       break
      elsif @num_input > @num
        @flag_small = false
        output
      elsif @num_input < @num
        @flag_small = true
        output
      end
    end
  end

  def output
    if @flag_correct == false
      if @flag_small == false
        puts "#{@num_input}は正解より大きいです"
      else
        puts "#{@num_input}は正解より小さいです"
      end
    else
      puts "正解です。正解まで#{@cnt}回答えました"
    end
  end
end

game = Number_game.new
game.number_game
