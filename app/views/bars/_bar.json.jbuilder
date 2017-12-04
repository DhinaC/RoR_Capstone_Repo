#json.extract! bar, :id, :name, :created_at, :updated_at

#json.id.id_to_s - added for error to debug
byebug
json.id bar.id
json.name bar.name
json.created_at bar.created_at
json.updated_at bar.updated_at
json.url bar_url(bar, format: :json)
