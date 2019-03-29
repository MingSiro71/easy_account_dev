json.extract! user, :id, :name, :login_code, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
