json.extract! user, :id, :username, :password, :account_type, :created_at, :updated_at
json.url user_url(user, format: :json)