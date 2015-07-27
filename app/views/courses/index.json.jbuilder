json.array!(@courses) do |course|
  json.extract! course, :id, :nom, :distance, :ville, :date, :description, :url
  json.url course_url(course, format: :json)
end
