json.array!(@thought_records) do |thought_record|
  json.extract! thought_record, :id, :CurrentSituation, :Emotions, :FirstEmotionStrength, :AutoThoughts, :AltResponse, :SecondEmotionStrength
  json.url thought_record_url(thought_record, format: :json)
end
