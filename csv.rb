#call the libraries
require 'csv'
require 'date'
class Time_data
  #add up the working time for each day of the week
  def data
    week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    time = {"SUN":0, "MON":0, "TUE":0, "WED":0, "THU":0, "FRI":0, "SAT":0}
    csv_data = CSV.read("./timesheet201804.csv",headers:true)
    csv_data.each do |row|
      time[:"#{week[Date.parse(row["‹Î–±“ú"]).wday]}"] += row["ì‹ÆŠÔ"].to_f
    end
    #output
    p time
  end
end
csv=Time_data.new
csv.data
