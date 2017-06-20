class PoemsController < ApplicationController

  # ACTIONS 

  def index
    @poems = Poem.all
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def create
    @poem = Poem.new(poem_attributes_params)
    @poem.update_relationships(poem_relationships_params)

    if @poem.save
      render 'poems/show', status: :created
    else
      render 'poems/errors', status: :bad_request
    end
  end

  def update
    @poem = Poem.find(params[:id])

    binding.pry

    @poem.update_attributes(poem_attributes_params)

    binding.pry

    if @poem.save
      render 'poems/show'
    else
      render 'poems/errors', status: :bad_request
    end
  end

  def destroy
  end

  private

  def poem_attributes_params
    params.require(:data).require(:attributes).permit(:title, :year, :text)
  end

  def poem_relationships_params
    params.require(:data).require(:relationships).permit(author: [data: [:id]])
  end
end