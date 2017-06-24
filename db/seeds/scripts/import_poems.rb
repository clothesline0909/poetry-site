require 'yaml'
require 'pry'

POEMS_FOLDER = "db/seeds/poems"

# Get poem file names.
filenames = Dir["#{POEMS_FOLDER}/*"]

filenames.each do |filename|
  ActiveRecord::Base.transaction do

    # Load the poem data.
    poem_data = YAML.load_file("#{filename}")

    # Create author if they don't already exist.
    author = Author.create_with(biography: 'BLANK').find_or_create_by!(name: poem_data['author'])

    # Create poem if it doesn't already exist.
    Poem.create_with(year: poem_data['year'], text: poem_data['text']).find_or_create_by!(title: poem_data['title'], author: author)
  end
end

