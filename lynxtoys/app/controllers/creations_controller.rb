class CreationsController < ApplicationController
  #def index
#	@creations = Creation.first
#	@id = @creations.creation_id
#	@pictures = Picture.where(creation_id: @id)
#  end
  def index
    @creations = Creation.all
  end
  
  def new
	@creation = Creation.new
  end
  
  def create
    @creation = Creation.new(creation_params)
    if @creation.save
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end
  
  def show
	@creation = Creation.find(params[:id])
  end
 
  def delete
	@creation = Creation.find(params[:id])
  end

  def destroy
	Creation.find(params[:id]).destroy
	redirect_to(:action => 'index')
  end
  
  private
  
  def creation_params
	params.require(:creation).permit(:name, :image)
  end
end
