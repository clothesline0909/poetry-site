json.author do
  json.links do
    json.related URLBuilder.url_for_resource(poem.author)
  end
end