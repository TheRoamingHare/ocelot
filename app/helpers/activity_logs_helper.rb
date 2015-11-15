module ActivityLogsHelper
  def windowify(myint)
    return "#{myint}:00 - #{myint+1}:00"
  end
end
