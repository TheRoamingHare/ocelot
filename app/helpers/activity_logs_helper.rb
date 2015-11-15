module ActivityLogsHelper
  def windowify(myint)
    nice_num = myint % 13
    return "#{nice_num}:00 #{ampm(myint)} - #{nice_num+1}:00 #{ampm(myint)}"
  end

  def ampm(myint)
    return myint > 12 ? "PM" : "AM"
  end
end
