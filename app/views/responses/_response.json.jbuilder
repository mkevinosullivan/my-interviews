json.extract! response, :id, :response, :score, :created_at, :updated_at
json.url response_url(response, format: :json)
