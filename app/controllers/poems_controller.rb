class PoemsController < ApplicationController

  # ACTIONS 

  def index
    @unpaginated_poems = Poem.all.order(*sort_params_array)
    @poems = @unpaginated_poems.page(page_number).per(page_size)
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def create
    @poem = Poem.new(poem_attributes_params)
    @poem.assign_relationships(poem_relationships_params)

    if @poem.save
      render 'poems/show', status: :created
    else
      render 'errors/errors', status: :bad_request
    end
  end

  def update
    @poem = Poem.find(params[:id])
    @poem.assign_attributes(poem_attributes_params)
    @poem.assign_relationships(poem_relationships_params) 

    if @poem.save
      render 'poems/show'
    else
      render 'errors/errors', status: :bad_request
    end
  end

  def destroy
  end

  private

  def poem_attributes_params
    params.require(:data).permit(attributes: [:title, :year, :text])
  end

  def poem_relationships_params
    params.require(:data).permit(relationships: [author: [data: [:id]]])
  end
end