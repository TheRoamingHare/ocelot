json.array!(@users) do |user|
  json.extract! user, :id, :Name, :Zip, :Age, :email
  json.url user_url(user, format: :json)
end
