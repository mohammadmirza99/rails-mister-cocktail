class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(safe_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail.id)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail_id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(@cocktail_id)
  end

  private

  def safe_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
