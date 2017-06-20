class AuthorsController < ApplicationController

  # ACTIONS 

  def index
    @authors = Author.all
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def author_params
    params.require(:data).permit(:type, attributes: [:name, :biography])
  end
end