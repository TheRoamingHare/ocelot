json.array!(@activity_logs) do |activity_log|
  json.extract! activity_log, :id, :CurrentActivity, :CurrentMood, :NormalWake, :NormalSleep
  json.url activity_log_url(activity_log, format: :json)
end
