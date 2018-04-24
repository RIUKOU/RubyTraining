class Cale
  def initialize
    puts "年を入力してください"
    @year = gets.chomp.to_i
    puts "月を入力してください"
    @month = gets.chomp.to_i
    @flag_leap = false
    @month_ = [ "Jan.", "Feb.", "Mar.", "Apr.", "May.", "Jun.", "Jul.", "Aug.", "Sep.", "Oct.", "Nov.", "Dec."]
  end

  def cale
    if @month == 1 || @month == 2
      month = @month + 12
      year = @year - 1
    else
      month = @month
      year = @year
    end

    if @year % 100 == 0
      if @year % 400 == 0
        @flag_leap = true
      end
    elsif @year % 4 == 0
      @flag_leap = true
    end

    @h = (year + year / 4 - year / 100 + year / 400 + (13 * month + 8) / 5 + 1) % 7

    @days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    @leap_days = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    month = @month - 1
    puts "        #{@month_[month]}   #{@year}\n---------------------------"
    puts "Sun Mon Tue Wed Thu Fri Sat"

    if @h < 0
      @h += 7
    end
    @h.times do
      print "    "
    end

    if @flag_leap == false
      (1..@days[@month - 1]).each do |date|
        print format("%3d ",date)
        @h += 1
        if @h % 7 == 0
          puts ""
        end
      end

    elsif @flag_leap == true
      (1..@leap_days[@month - 1]).each do |date|
        print format("%3d ",date)
        @h += 1
        if @h % 7 == 0
          puts ""
        end
      end
    end
    puts "\n---------------------------"
  end
end

cale = Cale.new
cale.cale
