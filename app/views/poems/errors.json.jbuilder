json.errors ErrorBuilder.errors_for(@poem) do |error|
  json.partial! 'poems/error', error: error
end