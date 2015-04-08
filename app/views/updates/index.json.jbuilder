json.array!(@updates) do |update|
  json.extract! update, :id, :title, :summary, :date
  json.url update_url(update, format: :json)
end
