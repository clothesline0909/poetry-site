json.type :authors
json.id author.id
json.attributes do
  json.name author.name
  json.biography author.biography
end
if with_relationships
  json.relationships do
    json.partial! 'authors/relationships', author: author
  end
end
