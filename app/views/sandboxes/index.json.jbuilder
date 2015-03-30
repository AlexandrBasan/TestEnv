json.array!(@sandboxes) do |sandbox|
  json.extract! sandbox, :id, :name
  json.url sandbox_url(sandbox, format: :json)
end
