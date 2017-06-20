json.type :poems
json.id poem.id
json.attributes do
  json.title poem.title
  json.year poem.year
  json.text poem.text
end
if with_relationships
  json.relationships do
    json.partial! 'poems/relationships', poem: poem
  end
end
