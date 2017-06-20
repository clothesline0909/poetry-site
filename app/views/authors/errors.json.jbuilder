json.errors ErrorBuilder.errors_for(@author) do |error|
  json.partial! 'authors/error', error: error
end