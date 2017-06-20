class ApplicationController < ActionController::API

  # CALLBACKS

  before_action :set_headers

  # RESCUES

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def set_headers
    response.headers['Content-Type'] = 'application/vnd.api+json'
  end

  def record_not_found
    head :not_found
  end
end
