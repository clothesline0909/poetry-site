class AuthorsController < ApplicationController

  # ACTIONS 

  def index
    @authors = Author.all
  end

  def show
    @author = Author.find(params[:id])
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      render 'authors/show', status: :created
    else
      render 'authors/errors', status: :bad_request
    end
  end

  def update
    @author = Author.find(params[:id])
    @author.update_attributes(author_params)

    if @author.save
      render 'authors/show'
    else
      render 'authors/errors', status: :bad_request
    end
  end

  def destroy
  end

  private

  def author_params
    params.require(:data).permit(attributes: [:name, :biography])
  end
end