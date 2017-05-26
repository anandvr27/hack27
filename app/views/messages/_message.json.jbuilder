json.extract! message, :id, :path, :value, :created_at, :updated_at
json.url message_url(message, format: :json)
