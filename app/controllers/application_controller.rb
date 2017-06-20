class ApplicationController < ActionController::API

  # CALLBACKS

  before_action :set_headers

  # RESCUES

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

  private

  def set_headers
    response.headers['Content-Type'] = 'application/vnd.api+json'
  end

  def record_not_found_error(exception)
    @errors = [{
      status: 404,
      detail: exception.message
    }]

    render 'errors/errors', status: :not_found
  end

  def page_number
    params['page'].try(:[], 'number') || 1
  end

  def page_size
    params['page'].try(:[], 'size') || 25
  end
end
