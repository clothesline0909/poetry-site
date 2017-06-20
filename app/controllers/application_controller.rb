class ApplicationController < ActionController::API

  # CALLBACKS

  before_action :set_headers

  private

  def set_headers
    response.headers['Content-Type'] = 'application/vnd.api+json'
  end
end
