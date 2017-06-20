json.links do
  json.self URLBuilder.url_for_model(Poem)
end
json.data @poems do |poem|
  json.partial! 'poems/item', poem: poem, with_relationships: false
end