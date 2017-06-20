json.poems author.poems do |poem|
  json.links do
    json.related URLBuilder.url_for_resource(poem)
  end
end