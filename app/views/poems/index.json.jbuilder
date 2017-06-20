json.meta do
  json.count @poems.count
  json.total_count @unpaginated_poems.count
end
json.links do
  json.self URLBuilder.url_for_model(Poem)
end
json.data @poems do |poem|
  json.partial! 'poems/item', poem: poem, with_relationships: false
end