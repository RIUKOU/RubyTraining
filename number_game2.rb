class Number_game2
  def initialize
    puts "4桁の重複がない数字を入力してください"
    @num_c = []
    @num_p = []
    #　アルゴリズムする必要あり
    n1 = 0
    n2 = 0
    n3 = 0
    n4 = 0
    while n1==n2||n1==n3||n1==n4||n2==n3||n2==n4||n3==n4
      n1 = rand(1..9)
      n2 = rand(1..9)
      n3 = rand(1..9)
      n4 = rand(1..9)
    end
    @num_c[0] = n1
    @num_c[1] = n2
    @num_c[2] = n3
    @num_c[3] = n4
    #　以上
    @flag_c = false
    @cnt = 0
  end

  def number_game2
    while @flag_c == false
      @hit = 0
      @blow = 0
      @num = gets.chomp
      @cnt += 1
      4.times do |n|
        @num_p[n] = @num.slice(n).to_i
      end
      4.times do |n|
        4.times do |m|
          if @num_p[m] == @num_c[n]
            if m == n
              @hit += 1
            end
            if m != n
              @blow += 1
            end
          end
        end
      end
      output
      if @hit == 4
        @flag_c = true
        break
      end
    end
    output
  end

  def output
    if @flag_c == true
      puts "正解です。正解まで#{@cnt}回答えました"
    else
      puts "#{@hit} Hit #{@blow} blow"
    end
  end
end

game = Number_game2.new
game.number_game2
