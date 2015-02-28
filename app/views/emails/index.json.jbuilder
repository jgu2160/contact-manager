json.array!(@emails) do |email|
  json.extract! email, :id, :address, :person_id
  json.url email_url(email, format: :json)
end
