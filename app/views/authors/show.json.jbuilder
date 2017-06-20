json.links do
  json.self URLBuilder.url_for_resource(@author)
end
json.data do
  json.partial! 'authors/item', author: @author, with_relationships: true
end