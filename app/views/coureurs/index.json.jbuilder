json.array!(@coureurs) do |coureur|
  json.extract! coureur, :id, :pseudo, :ville, :user_id
  json.url coureur_url(coureur, format: :json)
end
