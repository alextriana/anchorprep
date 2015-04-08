json.array!(@colleges) do |college|
  json.extract! college, :id, :name, :summary
  json.url college_url(college, format: :json)
end
