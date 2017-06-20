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
      render 'authors/show'
    else
      render 'authors/errors', status: :bad_request
    end
  end

  def update
  end

  def destroy
  end

  private

  def author_params
    params.require(:data).permit(attributes: [:name, :biography])
  end
end