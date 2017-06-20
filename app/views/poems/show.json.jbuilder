json.links do
  json.self URLBuilder.url_for_resource(@poem)
end
json.data do
  json.partial! 'poems/item', poem: @poem, with_relationships: true
end