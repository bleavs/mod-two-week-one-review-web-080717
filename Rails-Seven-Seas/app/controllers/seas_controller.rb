require 'pry'
class SeasController < ApplicationController
  #define your controller actions here

  def index
    @seas = Sea.all
  end

  def create
    @sea = Sea.new(sea_params)

    if @sea.save
      render 'show'

    else
      render 'new'
    end

  end

  def new

    @sea = Sea.new
  end

  def edit
    @sea = Sea.find(params[:id])
  end

  def update
    @sea = Sea.find(params[:id])
    if @sea.update(sea_params)
      render "show"
    else
      render "edit"
    end

  end

  def destroy
    @seas = Sea.all
   @sea = Sea.find(params[:id])
   @sea.destroy

  #  render "index"
  end

  def show
  @sea = Sea.find(params[:id])
  end



  private
  # In controller actions, use this private method to access sea params from forms.
  # Example: Sea.update(sea_params)
  # check the return value of sea_params to see what you're working with!
  def sea_params
    params.require(:sea).permit(:name, :temperature, :bio, :mood, :image_url, :favorite_color, :scariest_creature, :has_mermaids)
  end

end
