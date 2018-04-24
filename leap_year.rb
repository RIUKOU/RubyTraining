class Leap_year
  def initialize
    puts "年数を入力してください"
    @year = gets.chomp.to_i
    @flag_leap = false
  end

  def leap_year
    if @year % 100 == 0
      if @year % 400 == 0
        @flag_leap = true
      end
    elsif @year % 4 == 0
      @flag_leap = true
    end
    output
  end

  def output
    if @flag_leap == true
      puts "#{@year}年はうるう年です"
    else
      puts "#{@year}年はうるう年ではありません"
    end
  end
end

leap = Leap_year.new
leap.leap_year
