class AuthorsController < ApplicationController

  # ACTIONS 

  def index
    @unpaginated_authors = Author.all.order(*sort_params_array)
    @authors = @unpaginated_authors.page(page_number).per(page_size)
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_attributes_params)

    if @author.save
      render 'authors/show', status: :created
    else
      render 'errors/errors', status: :bad_request
    end
  end

  def update
    @author = Author.find(params[:id])
    @author.assign_attributes(author_attributes_params)

    if @author.save
      render 'authors/show'
    else
      render 'errors/errors', status: :bad_request
    end
  end

  def destroy
  end

  private

  def author_attributes_params
    params.require(:data).permit(attributes: [:name, :biography])
  end
end