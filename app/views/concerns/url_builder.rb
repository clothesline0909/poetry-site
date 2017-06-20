class URLBuilder

  # PUBLIC CLASS METHODS

  # Method that returns the URL for a resource.
  def self.url_for(resource)

    # Convert class name to symbol.
    klass = resource.class.name.underscore.to_sym

    # Get the mapping for this resource class.
    base_url = url_mapper[klass]

    # Return the full URL.
    base_url + resource.id.to_s
  end

  # PRIVATE CLASS METHODS

  private

  # Method that maps a resource type to the correct base URL.
  def self.url_mapper
    {
      author: "#{ENV['DOMAIN_NAME']}/authors/",
      poem: "#{ENV['DOMAIN_NAME']}/poems/"
    }
  end
end