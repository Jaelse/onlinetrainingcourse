json.extract! subscriber, :id, :fname, :lname, :citizenid, :substype, :insorstid, :dept, :created_at, :updated_at
json.url subscriber_url(subscriber, format: :json)
