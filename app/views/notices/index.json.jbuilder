json.array!(@notices) do |notice|
  json.extract! notice, :id, :title, :message
  json.url notice_url(notice, format: :json)
end
