class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(safe_params)
      if @cocktail.save
        redirect_to new_cocktail_dose_path(@cocktail.id)
      else
        render :new
      end
  end

  private

def safe_params
  params.require(:cocktail).permit(:name)
end
end
