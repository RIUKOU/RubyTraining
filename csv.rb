require 'csv'
require 'date'
class Time_data
  def data
    csv_data = CSV.read('timesheet201804.csv')
    total = [0, 0, 0, 0, 0, 0, 0]
    csv_data = CSV.open("./timesheet201804.csv")
    csv_data.readline
    csv_data.each do |row|
        d = Date.parse row[0]
        case d.wday
        when 0
          total[0] += row[3].to_f
        when 1
          total[1] += row[3].to_f
        when 2
          total[2] += row[3].to_f
        when 3
          total[3] += row[3].to_f
        when 4
          total[4] += row[3].to_f
        when 5
          total[5] += row[3].to_f
        when 6
          total[6] += row[3].to_f
        end
    end
    puts "SUN. #{total[0]}\nMON. #{total[1]}\nTUE. #{total[2]}\nWED. #{total[3]}\nTHU. #{total[4]}\nFRI. #{total[5]}\nSAT. #{total[6]}\n"
  end
end
csv=Time_data.new
csv.data
