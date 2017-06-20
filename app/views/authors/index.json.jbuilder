json.links do
  json.self URLBuilder.url_for_model(Author)
end
json.data @authors do |author|
  json.partial! 'authors/item', author: author, with_relationships: false
end